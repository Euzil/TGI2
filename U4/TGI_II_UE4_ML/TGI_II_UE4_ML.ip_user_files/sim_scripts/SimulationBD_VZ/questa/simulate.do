onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib SimulationBD_VZ_opt

do {wave.do}

view wave
view structure
view signals

do {SimulationBD_VZ.udo}

run -all

quit -force
