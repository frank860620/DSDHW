wvResizeWindow -win $_nWave1 54 259 960 332
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04099/DSDHW/HW1-3/1-CR_Adder/adder.fsdb}
wvZoom -win $_nWave1 190.685640 449.676585
wvSetCursor -win $_nWave1 242.952894
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/adder_gate_test/A/out\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 312.642566 332.075263
wvSetCursor -win $_nWave1 323.251361 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/adder_gate_test/A/out\[7:0\]} \
{/adder_gate_test/A/Cin} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/adder_gate_test/A/out\[7:0\]} \
{/adder_gate_test/A/Cin} \
{/adder_gate_test/A/x\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test/A"
wvExit
