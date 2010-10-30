# Remember to list sources in dependency order
SRCS=alu_pkg.vhdl alu_impl.vhdl alu_tb.vhdl
VHDLCC=ghdl
TESTBENCH=alu_tb
VCDFILE=alu.vcd

all: build

build: alu_pkg.o alu_impl.o alu_tb.o

alu_pkg.o:
	$(VHDLCC) -a alu_pkg.vhdl

alu_impl.o:
	$(VHDLCC) -a alu_impl.vhdl

alu_tb.o:
	$(VHDLCC) -a alu_tb.vhdl

test: build
	$(VHDLCC) -e $(TESTBENCH)
	$(VHDLCC) -r $(TESTBENCH) --vcd=$(VCDFILE)

clean:
	rm -f *.o
