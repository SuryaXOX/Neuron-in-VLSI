** Generated on: Dec  4 13:53:03 2022
** Design library name: ECE555
** Design cell name: ADDER_M
** Design view name: schematic

** Library name: ECE555
** Cell name: ADDER_RIGHT
** View name: schematic
.subckt ADDER_RIGHT a b cin _net1 _net0 vdd vss
mn6 net11 b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn5 net8 a net11 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn4 _net0 cin net8 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn3 _net0 _net1 net1 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 net1 cin vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn1 net1 b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn0 net1 a vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mp13 _net0 cin net7 vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp12 net7 a net6 vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp11 net6 b vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp10 net5 a vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp9 _net0 _net1 net5 vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp8 net5 cin vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp7 net5 b vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
.ends ADDER_RIGHT
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER_LEFT
** View name: schematic
.subckt ADDER_LEFT a b cin _net0 vdd vss
mn9 _net0 a net5 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn8 net5 b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 net3 b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn1 net3 a vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn0 _net0 cin net3 vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mp7 _net0 a net6 vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp6 net6 b vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp5 net7 b vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp4 net7 a vdd vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
mp3 _net0 cin net7 vdd pmos_rvt w=54e-9 l=20e-9 nfin=2
.ends ADDER_LEFT
** End of subcircuit definition.

** Library name: ECE555
** Cell name: ADDER_M
** View name: schematic
xi3 a b cin _net0 _net1 vdd! vss! ADDER_RIGHT
xi2 a b cin _net0 vdd! vss! ADDER_LEFT
