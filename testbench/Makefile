

CC=iverilog
src=$(wildcard ../verilog/*.v *.v)

testbench:	$(src)
	$(CC) -o $@ $^

clean:
	rm -f testbench
