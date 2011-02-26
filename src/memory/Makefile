# Remember to list sources in dependency order
SRCS=memory_pkg.vhdl memory_impl.vhdl memory_tb.vhdl
VHDLCC=ghdl
TESTBENCH=memory_tb
VCDFILE=memory.vcd

all: build

build: memory_pkg.o memory_impl.o memory_tb.o

memory_pkg.o:
	$(VHDLCC) -a memory_pkg.vhdl

memory_impl.o:
	$(VHDLCC) -a memory_impl.vhdl

memory_tb.o:
	$(VHDLCC) -a memory_tb.vhdl

test: build
	$(VHDLCC) -e $(TESTBENCH)
	$(VHDLCC) -r $(TESTBENCH) --vcd=$(VCDFILE)

clean:
	rm -f *.o
