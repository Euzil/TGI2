onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib SimulationBD_Automat_opt

do {wave.do}

view wave
view structure
view signals

do {SimulationBD_Automat.udo}

run -all

quit -force
