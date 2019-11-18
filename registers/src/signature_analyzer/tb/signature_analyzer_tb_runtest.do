SetActiveLib -work
comp -include "$dsn\src\signature_analyzer\signature_analyzer.vhd" 
comp -include "$dsn\src\signature_analyzer\tb\signature_analyzer_tb.vhd"
asim +access +r signature_analyzer_tb tb

wave

wave -noreg Pin
wave -noreg CLR
wave -noreg CLK

wave -noreg Pout

run 180 ns