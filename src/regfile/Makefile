# Remember to list sources in dependency order
SRCS=regfile_pkg.vhdl regfile_impl.vhdl regfile_tb.vhdl
VHDLCC=ghdl
TESTBENCH=regfile_tb
VCDFILE=regfile.vcd

all: build

build: regfile_pkg.o regfile_impl.o regfile_tb.o

regfile_pkg.o:
	$(VHDLCC) -a regfile_pkg.vhdl

regfile_impl.o:
	$(VHDLCC) -a regfile_impl.vhdl

regfile_tb.o:
	$(VHDLCC) -a regfile_tb.vhdl

test: build
	$(VHDLCC) -e $(TESTBENCH)
	$(VHDLCC) -r $(TESTBENCH) --vcd=$(VCDFILE)

clean:
	rm -f *.o
