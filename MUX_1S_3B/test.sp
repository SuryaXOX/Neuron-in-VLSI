* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
*.INCLUDE "AND2.pex.netlist" * Enable this line for layout netlist
.INCLUDE "MUX_1S_3B.pex.netlist" 
.INCLUDE "INV_2bit.sp"
 
* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
*xdut vdd! vss! A B Cin Cout Sum ADDER_M
v1 vdd! 0 0.9v
v2 vss! 0 0v

xduts S vdd! vss! F<2> B<2> A<2> F<1> B<1> A<1> A<0> F<0> B<0> MUX_1S_3B
* Below good when tested
vin0 S gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 24ns 0v 24.025ns 0.9v )
vin2 A<0> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v 24ns 0.9v 24.025ns 0v 36ns 0v 36.025ns 0.9v )
vin3 A<1> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v 24ns 0.9v 24.025ns 0v 36ns 0v 36.025ns 0.9v )
vin6 A<2> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v 24ns 0.9v 24.025ns 0v 36ns 0v 36.025ns 0.9v )
vin4 B<0> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 6ns 0v 6.025ns 0.9v 12ns 0.9v 12.025ns 0v 18ns 0v 18.025ns 0.9v 24ns 0.9v 24.025ns 0v 30ns 0v 30.025ns 0.9v 36ns 0.9v 36.025ns 0v 42ns 0v 42.025ns 0.9v 48ns 0.9v 48.025ns 0v)
vin5 B<1> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 6ns 0v 6.025ns 0.9v 12ns 0.9v 12.025ns 0v 18ns 0v 18.025ns 0.9v 24ns 0.9v 24.025ns 0v 30ns 0v 30.025ns 0.9v 36ns 0.9v 36.025ns 0v 42ns 0v 42.025ns 0.9v 48ns 0.9v 48.025ns 0v)
vin7 B<2> gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 6ns 0v 6.025ns 0.9v 12ns 0.9v 12.025ns 0v 18ns 0v 18.025ns 0.9v 24ns 0.9v 24.025ns 0v 30ns 0v 30.025ns 0.9v 36ns 0.9v 36.025ns 0v 42ns 0v 42.025ns 0.9v 48ns 0.9v 48.025ns 0v)

* Set fanout manually or by instantiating four other inverters
xfan0 F<0> out1 INV M=4
xfan1 F<1> out2 INV M=4
xfan2 F<2> out3 INV M=4

* Transient analysis
* .tr 10ps 24ns
.tran 100p 50ns
.end


