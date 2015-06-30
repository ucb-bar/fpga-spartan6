OBJCOPY := objcopy

ifndef ELF
$(error usage: $(MAKE) ELF=<file> [mem|bit|clean])
endif

BASE := $(patsubst %.elf,%,$(notdir $(ELF)))
HEX := $(BASE).vh
MEM := $(BASE).mem
BIT := $(BASE).bit

MEM_LN := current.mem
BIT_IN := ../implementation/system.bit
BMM := system_bd.bmm

BRAM_ADDR := 0x0000
BRAM_SIZE := 0x4000

.PHONY: mem bit
mem: $(MEM) $(MEM_LN)
bit: $(BIT)

$(HEX): $(ELF)
	$(OBJCOPY) -S -O verilog --change-addresses -$(BRAM_ADDR) $< $@

$(MEM): $(HEX) mem.awk
	awk -v SIZE=$(BRAM_SIZE) -f mem.awk $< > $@

$(MEM_LN): $(MEM)
	ln -s $< $@

$(BIT): $(BMM) $(MEM) $(BIT_IN)
	data2mem -bm $(BMM) -bd $(MEM) -bt $(BIT_IN) -o b $@

%.mcs %.prm %.cfi: %.bit
	promgen -w -p mcs -c FF -s 16384 -u 0 -spi $<

.PHONY: clean
clean:
	rm -f $(HEX) $(MEM) $(BIT)
