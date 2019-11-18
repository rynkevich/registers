SetActiveLib -work
comp -include "$dsn\src\shift_register\shift_register_tb.vhd" 
comp -include "$dsn\src\shift_register\tb\shift_register_tb.vhd"
asim +access +r shift_register_tb tb

wave

wave -noreg RST
wave -noreg SE
wave -noreg CLK
wave -noreg Sin

wave -noreg Pout_beh
wave -noreg Pout_struct

wave -noreg Error

run 320 ns