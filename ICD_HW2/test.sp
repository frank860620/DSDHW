*------------------------------------------------
* Parameters and models
*------------------------------------------------
.include 'mosistsmc180.sp'
.param SUPPLY=1.0
.param N1=4.0
.param P1=4.0 
.param N2=2.0 
.param P2=8.0 
.option scale=200n 
.temp 70
.option post

*------------------------------------------------
* Simulation netlist
*------------------------------------------------

Vdd vdd gnd 'SUPPLY'
Vin1 a gnd pwl 0ns 0 195ns 0 200ns 1.0 400ns 1.0 795ns 1.0 800ns 0 1000ns 0  
Vin2 b gnd pwl 0ns 0 295ns 0 300ns 1.0 495ns 1.0  500ns 0 600ns 0 795ns 0 800ns 1.0 1000ns 1.0

*NAND
M1 c a gnd gnd NMOS W='N1' L=2
+ AS='N1*5' PS='2*N1+10' AD='N1*5' PD='2*N1+10'
M2 out1 a vdd vdd PMOS W='P1' L=2
+ AS='P1*5' PS='2*P1+10' AD='P1*5' PD='2*P1+10'
M3 out1 b c gnd NMOS W='N1' L=2
+ AS='N1*5' PS='2*N1+10' AD='N1*5' PD='2*N1+10'
M4 out1 b vdd vdd PMOS W='P1' L=2
+ AS='P1*5' PS='2*P1+10' AD='P1*5' PD='2*P1+10'

*NOR
M5 out2 a gnd gnd NMOS W='N2' L=2
+ AS='N2*5' PS='2*N2+10' AD='N2*5' PD='2*N2+10'
M6 d a vdd vdd PMOS W='P2' L=2
+AS='P2*5' PS='2*P2+10' AD='P2*5' PD='2*P2+10'
M7 out2 b gnd gnd NMOS W='N2' L=2
+ AS='N2*5' PS='2*N2+10' AD='N2*5' PD='2*N2+10'
M8 out2 b d vdd PMOS W='P2' L=2
+ AS='P2*5' PS='2*P2+10' AD='P2*5' PD='2*P2+10'

*------------------------------------------------
* Stimulus
*------------------------------------------------
.tran 100ns 1000ns 
.end