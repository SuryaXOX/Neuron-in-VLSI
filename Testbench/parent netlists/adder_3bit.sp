.INCLUDE "ADDER_LEFT.pex.netlist"
.INCLUDE "ADDER_RIGHT.pex.netlist"

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
** Cell name: INV
** View name: schematic
.subckt INV a y
xm0 y a vss! vss! nmos_rvt w=81e-9 l=20e-9 nfin=3
xm1 y a vdd! vdd! pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER_M_3bit
** View name: schematic
xi12 a<2> b<2> net2 net4 net3 ADDER_M
xi6 net7 net8 net10 net2 sum<1> ADDER_M
xi5 a<0> b<0> cin net10 net9 ADDER_M
xi11 net4 cout INV
xi10 net3 sum<2> INV
xi9 net9 sum<0> INV
xi8 b<1> net8 INV
xi7 a<1> net7 INV