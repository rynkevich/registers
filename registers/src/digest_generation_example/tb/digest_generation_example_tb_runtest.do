SetActiveLib -work
comp -include "$dsn\src\digest_generation_example\digest_generation_example.vhd" 
comp -include "$dsn\src\digest_generation_example\tb\digest_generation_example_tb.vhd"
asim +access +r digest_generation_example_tb tb

wave
		  
wave -noreg Pin
wave -noreg LS
wave -noreg CLR
wave -noreg CLK

wave -noreg Pout

run 360 ns