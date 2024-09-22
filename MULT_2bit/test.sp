* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
*.INCLUDE "AND2.pex.netlist" * Enable this line for layout netlist
.INCLUDE "MULT_2bit.pex.netlist" 
.INCLUDE "INV.pex.netlist"
 
* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
*xdut vdd! vss! A B Cin Cout Sum ADDER_M
v1 vdd! 0 0.9v
v2 vss! 0 0v

xmult A<1> A<0> B<1> B<0> vss! vdd! F<1> F<0> MULT_2bit

* Below good when tested
vin0 A<1> gnd pwl(0ns 0.9v 1ns 0.9v 16ns 0.9v 16.025ns 0.0v)
vin1 A<0> gnd pwl(0ns 0.9v 1ns 0.9v 16ns 0.9v 16.025ns 0.0v 31ns 0.0v 31.025ns 0.9v)
vin2 B<1> gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 16ns 0.0v 16.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 31ns 0.0v 31.025ns 0.9v 36ns 0.9v 36.025ns 0.0v)
vin3 B<0> gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 11ns 0.0v 11.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 26ns 0.0v 26.025ns 0.9v 36ns 0.9v 36.025ns 0.0v 41ns 0.0v 41.025ns 0.9v)

* Set fanout manually or by instantiating four other inverters
xfan0 F<0> vss! vdd! out1 INV M=4
xfan1 F<1> vss! vdd! out2 INV M=4

* Transient analysis
* .tr 10ps 24ns
.tran 100p 45n
.end


