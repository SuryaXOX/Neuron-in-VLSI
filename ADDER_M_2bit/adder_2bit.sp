.INCLUDE "ADDER_LEFT.pex.netlist"
.INCLUDE "ADDER_RIGHT.pex.netlist"
.INCLUDE "INV_2bit.sp"

xi1 vss! vdd! a b cin _net0 ADDER_LEFT
xi2 vss! vdd! b a cin _net0 _net1 ADDER_RIGHT

** Library name: ECE555
** Cell name: ADDER_M
** View name: schematic
.subckt ADDER_M a b cin _net0 _net1
xi3 a b cin _net0 _net1 vdd! vss! ADDER_RIGHT
xi4 a b cin _net0 vdd! vss! ADDER_LEFT
.ends ADDER_M
** End of subcircuit definition.


** Library name: ECE555
** Cell name: ADDER_M_2bit
** View name: schematic
xi6 net7 net8 net10 cout sum<1> ADDER_M
xi5 a<0> b<0> cin net10 net9 ADDER_M
xi9 net9 sum<0> INV
xi8 b<1> net8 INV
xi7 a<1> net7 INV
