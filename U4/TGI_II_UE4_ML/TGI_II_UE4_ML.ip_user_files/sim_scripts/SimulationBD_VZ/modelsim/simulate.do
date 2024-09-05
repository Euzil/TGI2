onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xil_defaultlib -L xlconcat_v2_1_4 -L util_vector_logic_v2_0_1 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.SimulationBD_VZ xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {SimulationBD_VZ.udo}

run -all

quit -force
