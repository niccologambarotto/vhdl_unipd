GHDL = ghdl
STD = --std=08
TOP = tb_isPrime

all:
	$(GHDL) -a $(STD) *.vhd
	$(GHDL) -e $(STD) $(TOP)
	$(GHDL) -r $(STD) $(TOP) --vcd=output.vcd

clean:
	rm -f *.o *.cf output.vcd

wave:
	gtkwave output.vcd
