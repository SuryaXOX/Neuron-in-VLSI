.INCLUDE "Multiplexer.pex.netlist" 

xi0 vss! vdd! s a f b Multiplexer

** Library name: ECE555
** Cell name: MUX_1S_2B
** View name: schematic
.subckt MUX_1S_2B a<1> a<0> b<1> b<0> f<1> f<0> s
xi2 a<1> b<1> f<1> s vdd! vss! Multiplexer
xi1 a<0> b<0> f<0> s vdd! vss! Multiplexer
.ends MUX_1S_2B
** End of subcircuit definition.

** Library name: ECE555
** Cell name: MULT_2bit
** View name: schematic
xi3 net3<0> net3<1> p00<1> p00<0> f<1> f<0> b<0> MUX_1S_2B
xi2 net2<0> net2<1> a<1> a<0> net3<0> net3<1> b<1> MUX_1S_2B
xi1 net1<0> net1<1> p00<1> p00<0> net2<0> net2<1> a<0> MUX_1S_2B
xi0 p01<1> p01<0> p11<1> p11<0> net1<0> net1<1> a<1> MUX_1S_2B