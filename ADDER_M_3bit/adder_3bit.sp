.INCLUDE "ADDER_LEFT.pex.netlist"
.INCLUDE "ADDER_RIGHT.pex.netlist"
.INCLUDE "INV.pex.netlist"

** Library name: ECE555
** Cell name: ADDER_M
** View name: schematic

// NOTE: Below is result of running ADE L; not what we want
// 
* .subckt ADDER_M a b cin _net0 _net1
* xa3 a b cin _net0 _net1 vdd! vss! ADDER_RIGHT
* xa4 a b cin _net0 vdd! vss! ADDER_LEFT
* .ends ADDER_M
** End of subcircuit definition.

.subckt ADDER_M a b Cin ~Cout ~Sum
xa1 vss! vdd! b a Cin ~Cout ~Sum ADDER_RIGHT 
xa2 vss! vdd! a b Cin ~Cout ADDER_LEFT
.ends ADDER_M

** Library name: ECE555
** Cell name: ADDER_M_3bit
** View name: schematic
xa3 a<2> b<2> net2 net4 net3 ADDER_M
xa4 net7 net8 net10 net2 sum<1> ADDER_M
xa5 a<0> b<0> cin net10 net9 ADDER_M

xinv1 vss! vdd! net4 cout INV
xinv2 vss! vdd! net3 sum<2> INV
xinv3 vss! vdd! net9 sum<0> INV
xinv4 vss! vdd! a<1> net7 INV
xinv5 vss! vdd! b<1> net8 INV
