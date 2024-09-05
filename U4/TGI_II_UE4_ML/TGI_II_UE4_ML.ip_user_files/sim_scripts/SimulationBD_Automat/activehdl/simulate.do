onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+SimulationBD_Automat -L xil_defaultlib -L xlconcat_v2_1_4 -L util_vector_logic_v2_0_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.SimulationBD_Automat xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {SimulationBD_Automat.udo}

run -all

endsim

quit -force
