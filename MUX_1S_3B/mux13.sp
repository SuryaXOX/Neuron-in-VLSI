.INCLUDE "Multiplexer.pex.netlist" 

* xm0 vss! vdd! s a f b Multiplexer

** Library name: ECE555
** Cell name: MUX_1S_3B
** View name: schematic
* xm3 a<2> b<2> f<2> s vdd! vss! Multiplexer
* xm2 a<1> b<1> f<1> s vdd! vss! Multiplexer
* xm1 a<0> b<0> f<0> s vdd! vss! Multiplexer

xm3 vss! vdd! s a<2> f<2> b<2> Multiplexer
xm2 vss! vdd! s a<1> f<1> b<1> Multiplexer
xm1 vss! vdd! s a<0> f<0> b<0> Multiplexer