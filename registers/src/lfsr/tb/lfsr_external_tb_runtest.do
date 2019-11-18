SetActiveLib -work
comp -include "$dsn\src\lfsr_external\lfsr_external.vhd" 
comp -include "$dsn\src\lfsr_external\tb\lfsr_external_tb.vhd"
asim +access +r lfsr_external_tb tb

wave

wave -noreg Pin
wave -noreg LS
wave -noreg CLK

wave -noreg Pout

run 320 ns