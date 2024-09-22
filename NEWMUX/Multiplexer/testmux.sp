* Example HSPICE testbench file (test.sp)
* transistor model
.GLOBAL vss! vdd!
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"

* Design Under Test (DUT)
*.INCLUDE "AND2.pex.netlist" * Enable this line for layout netlist
.INCLUDE "mux.sp" 
.INCLUDE "INV_2bit.sp"
 
* Simulation Parameters
.TEMP 25.0
.options artist=2 ingold=2 parhier=local psf=2 hier_delim=0 accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1

* Instantiate (DUT)
*xdut vdd! vss! A B Cin Cout Sum ADDER_M
v1 vdd! 0 0.9v
v2 vss! 0 0v

* Below good when tested
vin0 S gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 24ns 0v 24.025ns 0.9v )
vin1 A gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v 24ns 0.9v 24.025ns 0v 36ns 0v 36.025ns 0.9v )
vin2 B gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 6ns 0v 6.025ns 0.9v 12ns 0.9v 12.025ns 0v 18ns 0v 18.025ns 0.9v 24ns 0.9v 24.025ns 0v 30ns 0v 30.025ns 0.9v 36ns 0.9v 36.025ns 0v 42ns 0v 42.025ns 0.9v 48ns 0.9v 48.025ns 0v)
*va A 0 PULSE 0 1.1 0 1n 1n 10n 20n
*vb B 0 PULSE 0 1.1 5n 1n 1n 10n 20n

* Set fanout manually or by instantiating four other inverters
xduts F out1 INV M=4

* Transient analysis
* .tr 10ps 24ns
.tran 100p 50n
.end
