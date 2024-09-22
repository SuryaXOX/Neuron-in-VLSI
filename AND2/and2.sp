** Generated for: hspiceD
** Generated on: Oct 23 19:33:44 2022
** Design library name: ECE555
** Design cell name: AND2
** Design view name: schematic

** Library name: ECE555
** Cell name: NAND2
** View name: schematic
.subckt NAND2 in0 in1 out
mp3 out in1 vdd! vdd! pmos_sram w=54e-9 l=20e-9 nfin=2
mp0 out in0 vdd! vdd! pmos_sram w=54e-9 l=20e-9 nfin=2
mn2 net1 in1 vss! vss! nmos_sram w=108e-9 l=20e-9 nfin=4
mn1 out in0 net1 vss! nmos_sram w=108e-9 l=20e-9 nfin=4
.ends NAND2
** End of subcircuit definition.

** Library name: ECE555
** Cell name: INV1
** View name: schematic
.subckt INV1 in out
mn0 out in vss! vss! nmos_sram w=54e-9 l=20e-9 nfin=2
mp1 out in vdd! vdd! pmos_sram w=54e-9 l=20e-9 nfin=2
.ends INV1
** End of subcircuit definition.

** Library name: ECE555
** Cell name: AND2
** View name: schematic
xi4 in0 in1 net1 NAND2
xi3 net1 out INV1
