.INCLUDE "./netlists/ADDER_LEFT.pex.netlist"
.INCLUDE "./netlists/ADDER_RIGHT.pex.netlist"
.INCLUDE "./netlists/Multiplexer.pex.netlist" 


xn1 vss! vdd! a b cin _net0 ADDER_LEFT
xn2 vss! vdd! b a cin _net0 _net1 ADDER_RIGHT
xn0 vss! vdd! s a f b Multiplexer


** Library name: ECE555
** Cell name: ADDER_M
** View name: schematic
.subckt ADDER_M a b cin _net0 _net1
xa0 a b cin _net0 _net1 vdd! vss! ADDER_RIGHT
xa1 a b cin _net0 vdd! vss! ADDER_LEFT
.ends ADDER_M
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER_M_2bit
** View name: schematic
.subckt ADDER_M_2bit a<1> a<0> b<1> b<0> cin cout sum<1> sum<0>
xa2 net7 net8 net10 cout sum<1> ADDER_M
xa3 a<0> b<0> cin net10 net9 ADDER_M
xa4 net9 sum<0> INV
xa5 b<1> net8 INV
xa6 a<1> net7 INV
.ends ADDER_M_2bit
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER_M_3bit
** View name: schematic
.subckt ADDER_M_3bit a<2> a<1> a<0> b<2> b<1> b<0> cin cout sum<2> sum<1> sum<0>
xa7 a<2> b<2> net2 net4 net3 ADDER_M
xa8 net7 net8 net10 net2 sum<1> ADDER_M
xa9 a<0> b<0> cin net10 net9 ADDER_M
xa10 net4 cout INV
xa11 net3 sum<2> INV
xa12 net9 sum<0> INV
xa13 b<1> net8 INV
xa14 a<1> net7 INV
.ends ADDER_M_3bit
** End of subcircuit definition.

** Library name: ECE555
** Cell name: MUX_1S_3B
** View name: schematic
.subckt MUX_1S_3B a<2> a<1> a<0> b<2> b<1> b<0> f<2> f<1> f<0> s
xm8 a<2> b<2> f<2> s vdd! vss! Multiplexer
xm7 a<1> b<1> f<1> s vdd! vss! Multiplexer
xm6 a<0> b<0> f<0> s vdd! vss! Multiplexer
.ends MUX_1S_3B
** End of subcircuit definition.

** Library name: ECE555
** Cell name: MUX_1S_2B
** View name: schematic
.subckt MUX_1S_2B a<1> a<0> b<1> b<0> f<1> f<0> s
xm10 a<1> b<1> f<1> s vdd! vss! Multiplexer
xm9 a<0> b<0> f<0> s vdd! vss! Multiplexer
.ends MUX_1S_2B
** End of subcircuit definition.

** Library name: ECE555
** Cell name: MULT_2bit
** View name: schematic
.subckt MULT_2bit a<1> a<0> b<1> b<0> f<1> f<0> p00<1> p00<0> p01<1> p01<0> p11<1> p11<0>
xm14 net3<0> net3<1> p00<1> p00<0> f<1> f<0> b<0> MUX_1S_2B
xm13 net2<0> net2<1> a<1> a<0> net3<0> net3<1> b<1> MUX_1S_2B
xm12 net1<0> net1<1> p00<1> p00<0> net2<0> net2<1> a<0> MUX_1S_2B
xm11 p01<1> p01<0> p11<1> p11<0> net1<0> net1<1> a<1> MUX_1S_2B
.ends MULT_2bit
** End of subcircuit definition.

** Library name: ECE555
** Cell name: NEURON
** View name: schematic
xd0 net3<0> net3<1> net2<0> net2<1> vss! sum<2> sum<1> sum<0> ADDER_M_2bit
xd1 sum<2> sum<1> sum<0> w20<2> w20<1> w20<0> vss! x0 s<2> s<1> s<0> ADDER_M_3bit
xd5 vss! vss! vss! s<2> s<1> s<0> z<2> z<1> z<0> s<2> MUX_1S_3B
xd7 w00<1> w00<0> x0<1> x0<0> net3<0> net3<1> p00<1> p00<0> p01<1> p01<0> p11<1> p11<0> MULT_2bit
xd6 x1<1> x1<0> w10<1> w10<0> net2<0> net2<1> p00<1> p00<0> p01<1> p01<0> p11<1> p11<0> MULT_2bit
