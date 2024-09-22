* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
.INCLUDE "and2.sp" * Enable this line for schematic netlist

* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
*xdut0 in0 in1 out0 NAND2
* xdut1 out0 out1 INV1
*vdd0 vdd gnd 0.9v
v1 vdd! 0 0.9v
v2 vss! 0 0v

* Below good when tested
* v3 net1 0 pwl 0ns 0v   1ns 0v   1.02ns 0.9v 2ns 0.9v 2.02ns 0v   3ns 0v
vin1 in0 gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v)
vin0 in1 gnd pwl(0ns 0.9v 6ns 0.9v 6.025ns 0v 18ns 0v 18.025ns 0.9v)

* Set fanout manually or by instantiating four other inverters
* cout out gnd 100f
xduts out out1 INV1 M=4
* Transient analysis
.tr 10ps 24ns
.end