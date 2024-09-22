* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
*.INCLUDE "AND2.pex.netlist" * Enable this line for layout netlist
 
* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
*xdut vdd! vss! A B Cin Cout Sum ADDER_M
v1 vdd! 0 0.9v
v2 vss! 0 0v

* Below good when tested
vin0 m11 gnd pwl(0ns 0.9v 1ns 0.9v 16ns 0.9v 16.025ns 0.0v)
vin1 m10 gnd pwl(0ns 0.9v 1ns 0.9v 16ns 0.9v 16.025ns 0.0v 31ns 0.0v 31.025ns 0.9v)
vin2 m21 gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 16ns 0.0v 16.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 31ns 0.0v 31.025ns 0.9v 36ns 0.9v 36.025ns 0.0v)
vin3 m20 gnd pwl(0ns 0.9v 1ns 0.9v 6ns 0.9v 6.025ns 0.0v 11ns 0.0v 11.025ns 0.9v 21ns 0.9v 21.025ns 0.0v 26ns 0.0v 26.025ns 0.9v 36ns 0.9v 36.025ns 0.0v 41ns 0.0v 41.025ns 0.9v)

* Transient analysis
* .tr 10ps 24ns
.tran 100p 50n
.end

