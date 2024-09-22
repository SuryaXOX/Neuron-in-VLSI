* Design Under Test (DUT)
.INCLUDE "./netlists/ADDER_M_2bit.pex.netlist" 
.INCLUDE "./netlists/INV.pex.netlist"
 
* Instantiate (DUT)
v1 vdd! 0 0.9v
v2 vss! 0 0v
xdut2 vdd! vss! INPUTS OUTPUTS ADDER_M_2bit

* Below good when tested
vin0 A gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 24ns 0v 24.025ns 0.9v )
vin1 B gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 12ns 0v 12.025ns 0.9v 24ns 0.9v 24.025ns 0v 36ns 0v 36.025ns 0.9v )
vin2 Cin gnd pwl(0ns 0.9v 1ns 0.9v 1.025ns 0v 6ns 0v 6.025ns 0.9v 12ns 0.9v 12.025ns 0v 18ns 0v 18.025ns 0.9v 24ns 0.9v 24.025ns 0v 30ns 0v 30.025ns 0.9v 36ns 0.9v 36.025ns 0v 42ns 0v 42.025ns 0.9v 48ns 0.9v 48.025ns 0v)

