** Library name: ECE555
** Cell name: INV
** View name: schematic
.subckt INV in out
mn0 out in vss! vss! nmos_rvt w=27e-9 l=20e-9 nfin=1
mp1 out in vdd! vdd! pmos_rvt w=54e-9 l=20e-9 nfin=2
.ends INV

** Library name: ECE555
** Cell name: INV_2bit
** View name: schematic
xi1 in out INV

