* inv.sp
* Parameters and models
*------------------------------------------------
*------------------------------------------------
.include 'mosistsmc180.sp'
.param SUPPLY=1.0
.param N1=2.0 $ 4
.param P1=2.0 $ 4
.param N2=1.0 $ 2
.param P2=4.0 $ 8
.option scale=25n $180n // 助教說要設超過180n才不會爛掉
.temp 70
.option post
* Simulation netlist
*------------------------------------------------
Vdd vdd gnd 'SUPPLY'
Vin1 a gnd pwl 0ps 0 195ps 0 200ps 1.0 400ps 1.0
Vin2 b gnd pwl 0ps 0 95ps 0 100ps 1.0 295ps 1.0 300ps 0 400ps 0

M1 c a gnd gnd NMOS W='N1' L=2
+ AS='N1*5' PS='2*N1+10' AD='N1*5' PD='2*N1+10'
M2 out a vdd vdd PMOS W='P1' L=2
+ AS='P1*5' PS='2*P1+10' AD='P1*5' PD='2*P1+10'
M3 out b c gnd NMOS W='N1' L=2
+ AS='N1*5' PS='2*N1+10' AD='N1*5' PD='2*N1+10'
M4 out b vdd vdd PMOS W='P1' L=2
+ AS='P1*5' PS='2*P1+10' AD='P1*5' PD='2*P1+10'

M5 out2 a gnd gnd NMOS W='N2' L=2
+ AS='N2*5' PS='2*N2+10' AD='N2*5' PD='2*N2+10'
M6 out2 a vdd vdd PMOS W='P2' L=2
+AS='P2*5' PS='2*P2+10' AD='P2*5' PD='2*P2+10'
M7 out2 b gnd gnd NMOS W='N2' L=2
+ AS='N2*5' PS='2*N2+10' AD='N2*5' PD='2*N2+10'
M8 d b vdd vdd PMOS W='P2' L=2
+ AS='P2*5' PS='2*P2+10' AD='P2*5' PD='2*P2+10'
* Stimulus
*------------------------------------------------
.tran 0.1ps 80ps
.end
