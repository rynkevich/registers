SetActiveLib -work
comp -include "$dsn\src\lfsr_internal\lfsr_internal.vhd" 
comp -include "$dsn\src\lfsr_internal\tb\lfsr_internal_tb.vhd"
asim +access +r lfsr_internal_tb tb

wave

wave -noreg Pin
wave -noreg LS
wave -noreg CLK

wave -noreg Pout

run 320 ns