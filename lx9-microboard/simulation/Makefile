
.SUFFIXES:

SIMDIR := behavioral
SIMMKF := modelsim.mk

$(MAKECMDGOALS): $(SIMDIR)

.PHONY: $(SIMDIR)
$(SIMDIR): $(SIMMKF)
	@exec $(MAKE) -f $(realpath $(SIMMKF)) -C $@ $(MAKECMDGOALS)

define exportpath
ifdef $(1)
export $(1) := $(abspath $(value $(1)))
endif
endef
$(foreach var,BRAM FLASH,$(eval $(call exportpath,$(var))))


WGET ?= $(shell command -v wget 2>/dev/null)
CURL ?= $(shell command -v curl 2>/dev/null)

ifdef WGET
fetch = $(WGET) -O $(2) $(1)
else ifdef CURL
fetch = $(CURL) -o $(2) --ftp-pasv $(1)
else
$(error GNU Wget or cURL required for downloading behavioral models)
endif

DISTDIR ?= distfiles

MODELS    := # empty
SRCDIRS   := # empty
DISTFILES := # empty

MODELS          += lpddr
lpddr_SRCDIR    := $(SIMDIR)/MT46H32M16LFBF-5
lpddr_DISTURL   := 'http://www.micron.com/~/media/documents/products/sim-model/dram/lpddr1/lpddr_verilog_model.zip'
lpddr_DISTFILE  := $(DISTDIR)/micron-lpddr.zip

MODELS          += spifm
spifm_SRCDIR    := $(SIMDIR)/NU_N25Q128A13E_VG00
spifm_DISTURL   := 'http://www.micron.com/~/media/documents/products/sim-model/nor-flash/serial/bfm/n25q/n25q128a13e_3v_micronxip_vg00,-d-,tar.gz'
spifm_DISTFILE  := $(DISTDIR)/n25qxxx.tar.gz

define distfetch
DISTFILES += $($(1)_DISTFILE)
$($(1)_DISTFILE):
	mkdir -p $$(dir $$@)
	$(call fetch, $($(1)_DISTURL), $$@)
endef

define distextract
SRCDIRS += $($(1)_SRCDIR)
$($(1)_SRCDIR): $($(1)_DISTFILE)
ifneq ($(filter %.tar.gz,$($(1)_DISTFILE)),)
	tar xzf $$< -C $$(dir $$@)
else ifneq ($(filter %.zip,$($(1)_DISTFILE)),)
	unzip -q -d $$@ $$<
endif
	touch $$@
endef

$(foreach x,$(MODELS),$(eval $(call distfetch,$(x))))
$(foreach x,$(MODELS),$(eval $(call distextract,$(x))))

$(SIMDIR): $(SRCDIRS)

.PHONY: clean
clean:
	rm -rf -- $(SRCDIRS)

.PHONY: distclean
distclean: clean
	rm -f -- $(DISTFILES)

