SetActiveLib -work
comp -include "$dsn\src\johnson_counter\johnson_counter.vhd" 
comp -include "$dsn\src\johnson_counter\tb\johnson_counter_tb.vhd"
asim +access +r johnson_counter_tb tb

wave

wave -noreg Pin
wave -noreg RST
wave -noreg LS
wave -noreg CLK

wave -noreg Pout

run 320 ns