SetActiveLib -work
comp -include "$dsn\src\storage_registers\sync_storage_register.vhd" 
comp -include "$dsn\src\storage_registers\tb\sync_storage_register.vhd"
asim +access +r sync_storage_register_tb tb

wave

wave -noreg EN
wave -noreg CLK
wave -noreg Din

wave -noreg Dout_beh
wave -noreg Dout_struct

wave -noreg Error

run 320 ns