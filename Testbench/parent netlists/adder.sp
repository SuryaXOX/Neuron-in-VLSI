* Design Under Test (DUT)
.INCLUDE "./netlists/ADDER_LEFT.pex.netlist"
.INCLUDE "./netlists/ADDER_RIGHT.pex.netlist"

* Instantiate (DUT)
xdut1 vss! vdd! A B Cin ~Cout ADDER_LEFT
xdut2 vss! vdd! B A Cin ~Cout ~Sum ADDER_RIGHT
