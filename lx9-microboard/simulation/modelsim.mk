.DEFAULT_GOAL := compile
MKFDIR := $(dir $(lastword $(MAKEFILE_LIST)))

MODEL_TECH ?= /ecad/tools/mentor/modelsim10.3b/modeltech
ifndef MODEL_TECH
$(error Set MODEL_TECH=<ModelSim installation path>)
endif

VLIB := $(MODEL_TECH)/bin/vlib
VMAP := $(MODEL_TECH)/bin/vmap
VLOG := $(MODEL_TECH)/bin/vlog
VSIM := $(MODEL_TECH)/bin/vsim

CC := gcc
LD := ld
CFLAGS += -std=c99 -pedantic -Wall


WORKLIB := work

VLOGFLAGS += -novopt -incr -work $(WORKLIB)

VLOG_UNITS      := # empty
PATCH_STAMPS    := # empty
COMPILE_STAMPS  := # empty

VLOG_UNITS      += lpddr
lpddr_SRCDIR    := MT46H32M16LFBF-5
lpddr_VLOGSRC   := $(lpddr_SRCDIR)/mobile_ddr.v
lpddr_VLOGFLAGS := +incdir+$(lpddr_SRCDIR)/ +define+den512Mb +define+sg5 +define+x16
# Ignore "A `define was found on the same line as a SystemVerilog `ifdef, `ifndef, `elsif, or `else."
lpddr_VLOGFLAGS += -suppress 2902

VLOG_UNITS      += spifm
spifm_SRCDIR    := NU_N25Q128A13E_VG00
spifm_VLOGSRC   := $(spifm_SRCDIR)/code/N25Qxxx.v
spifm_VLOGFLAGS := +incdir+$(spifm_SRCDIR)/ +define+N25Q128A13E

BRAM    ?= ../../bram/current.mem
FLASH   ?= $(spifm_SRCDIR)/sim/mem_Q128_bottom.vmf
# Serial Flash Discovery Parameters
SFDP    ?= $(spifm_SRCDIR)/sim/sfdp.vmf

spifm_VLOGFLAGS += +define+FILENAME_mem=\"/dev/null\"
spifm_VLOGFLAGS += +define+FILENAME_sfdp=\"$(SFDP)\"

VLOG_UNITS      += tb
tb_SRCDIR       := $(MKFDIR)/tb
tb_VLOGSRC      := $(tb_SRCDIR)/system_tb.v
tb_VLOGFLAGS    :=


$(WORKLIB):
	$(VLIB) $(WORKLIB)
	$(VMAP) work $(WORKLIB)

define vlogunit
COMPILE_STAMPS += .compile.$(1)
.compile.$(1): $($(1)_VLOGSRC) | $(WORKLIB)
	$(VLOG) $(VLOGFLAGS) $($(1)_VLOGFLAGS) $($(1)_VLOGSRC)
	touch $$@
endef

$(foreach x,$(VLOG_UNITS),$(eval $(call vlogunit,$(x))))

SETUP_SEDFILE := $(tb_SRCDIR)/system_setup.do.sed

.patch.setup: system_setup.do $(SETUP_SEDFILE)
	sed -i.orig -f $(SETUP_SEDFILE) $<
	touch $@

PATCH_STAMPS += .patch.axibridge
.patch.axibridge: $(wildcard system_ahblite_axi_bridge_*_wrapper.vhd)
	sed -i.orig -e '/C_M_AXI_SUPPORTS_THREADS/d' $^
	touch $@

COMPILE_STAMPS += .compile.system
.compile.system: system.do .patch.axibridge
	$(VSIM) -batch -do 'do $<; exit'
	touch $@


VPIOBJS := value.so

$(VPIOBJS:.so=.o): %.o: $(MKFDIR)/vpi/%.c
	$(CC) $(CFLAGS) -fPIC -I $(MODEL_TECH)/include -I $(dir $<) -c -o $@ $<

$(VPIOBJS): %.so: %.o
	$(LD) -shared -E -o $@ $<

#export PLIOBJS += $(VPIOBJS)


.PHONY: compile
compile: $(COMPILE_STAMPS) $(VPIOBJS) .patch.setup

.PHONY: clean
clean:
	-$(VMAP) -del work && rm -rf -- $(WORKLIB)
	rm -f -- $(COMPILE_STAMPS) $(VPIOBJS) $(VPIOBJS:.so=.o)

.PHONY: distclean
distclean:
	rm -f -- $(PATCH_STAMPS)


DISASM := $(shell command -v spike-dasm 2>/dev/null)
ifdef DISASM
DISASM := 2>&1 | $(DISASM)
endif

VSIMFLAGS += +bram=$(BRAM) +flash=$(FLASH)
VSIMFLAGS += $(foreach obj,$(VPIOBJS),-pli $(obj))
VSIMFLAGS += -do system_setup.do
VSIMFLAGS += -novopt -t ps -L xilinxcorelib_ver -L secureip -L unisims_ver +notimingchecks -L unimacro_ver system_tb glbl

.PHONY: modelsim
modelsim: compile
	$(VSIM) -gui $(VSIMFLAGS) $(DISASM)

.PHONY: modelsim-cli
modelsim-cli: compile
	$(VSIM) -c $(VSIMFLAGS)
