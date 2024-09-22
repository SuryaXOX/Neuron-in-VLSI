* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
.INCLUDE "ADDER_M_3bit.pex.netlist" 
.INCLUDE "INV.pex.netlist" 
 
* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
v1 vdd! 0 0.9v
v2 vss! 0 0v

xadder vdd! vss! A<2> B<1> A<1> B<2> A<0> B<0> Cin Sum<1> Sum<2> Cout Sum<0> ADDER_M_3bit

* Below good when tested
vin0 A<2> gnd pwl(0ns 0.9v 1ns 0.9v 31ns 0.9v 31.025ns 0.0v)
vin1 A<1> gnd pwl(0ns 0.9v 1ns 0.9v 31ns 0.9v 31.025ns 0.0v)
vin2 A<0> gnd pwl(0ns 0.9v 1ns 0.9v 1ns 0.9v 1.025ns 0.0v 16ns 0.0v 16.025ns 0.9v 31ns 0.9v 31.025ns 0.0v 46ns 0.0v 46.025ns 0.9v)
vin3 B<2> gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 16ns 0.0v 16.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 31ns 0.0v 31.025ns 0.9v 36ns 0.9v 36.025ns 0.0v 46ns 0.0v 46.025ns 0.9v 51ns 0.9v 51.025ns 0.0v)
vin4 B<1> gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 16ns 0.0v 16.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 31ns 0.0v 31.025ns 0.9v 36ns 0.9v 36.025ns 0.0v 46ns 0.0v 46.025ns 0.9v 51ns 0.9v 51.025ns 0.0v)
vin5 B<0> gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 11ns 0.0v 11.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 26ns 0.0v 26.025ns 0.9v 36ns 0.9v 36.025ns 0.0v 41ns 0.0v 41.025ns 0.9v 51ns 0.9v 51.025ns 0.0v 56ns 0.0v 56.025ns 0.9v)
vin6 Cin gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0.0v)

* Set fanout manually or by instantiating four other inverters
xfan0 vss! vdd! Sum<0> out1 INV M=4
xfan1 vss! vdd! Sum<1> out2 INV M=4
xfan2 vss! vdd! Sum<2> out3 INV M=4
xfan3 vss! vdd! Cout out4 INV M=4

* Transient analysis
.tran 100p 65n
.end


