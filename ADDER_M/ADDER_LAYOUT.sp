.INCLUDE "ADDER_LEFT.pex.netlist"
.INCLUDE "ADDER_RIGHT.pex.netlist"

xi3 vss! vdd! A B Cin ~Cout ADDER_LEFT
xi2 vss! vdd! B A Cin ~Cout ~Sum ADDER_RIGHT
