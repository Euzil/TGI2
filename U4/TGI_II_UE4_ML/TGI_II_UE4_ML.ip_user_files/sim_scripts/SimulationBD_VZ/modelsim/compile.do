vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconcat_v2_1_4
vlib modelsim_lib/msim/util_vector_logic_v2_0_1

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconcat_v2_1_4 modelsim_lib/msim/xlconcat_v2_1_4
vmap util_vector_logic_v2_0_1 modelsim_lib/msim/util_vector_logic_v2_0_1

vcom -work xil_defaultlib  -93 \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_Operationswerk_0_0/sim/SimulationBD_VZ_Operationswerk_0_0.vhd" \

vlog -work xlconcat_v2_1_4  -incr \
"../../../../../TGI_II_UE4/TGI_II_UE4.srcs/sources_1/bd/SimulationBD_VZ/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_xlconcat_0_0/sim/SimulationBD_VZ_xlconcat_0_0.v" \

vlog -work util_vector_logic_v2_0_1  -incr \
"../../../../../TGI_II_UE4/TGI_II_UE4.srcs/sources_1/bd/SimulationBD_VZ/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_util_vector_logic_0_0/sim/SimulationBD_VZ_util_vector_logic_0_0.v" \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_xlconcat_1_0/sim/SimulationBD_VZ_xlconcat_1_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_circuit_Verzoerung_2_0_0/sim/SimulationBD_VZ_circuit_Verzoerung_2_0_0.vhd" \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_circuit_Zaehler_3_0_0/sim/SimulationBD_VZ_circuit_Zaehler_3_0_0.vhd" \
"../../../bd/SimulationBD_VZ/ip/SimulationBD_VZ_circuit_or_0_0/sim/SimulationBD_VZ_circuit_or_0_0.vhd" \
"../../../bd/SimulationBD_VZ/sim/SimulationBD_VZ.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

