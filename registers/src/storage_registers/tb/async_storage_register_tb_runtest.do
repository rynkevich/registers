SetActiveLib -work
comp -include "$dsn\src\storage_registers\async_storage_register.vhd" 
comp -include "$dsn\src\storage_registers\tb\async_storage_register.vhd"
asim +access +r async_storage_register_tb tb

wave

wave -noreg EN
wave -noreg Din

wave -noreg Dout_beh
wave -noreg Dout_struct

wave -noreg Error

run 160 ns