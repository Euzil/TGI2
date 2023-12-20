vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xlconcat_v2_1_4
vlib activehdl/util_vector_logic_v2_0_1

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xlconcat_v2_1_4 activehdl/xlconcat_v2_1_4
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1

vcom -work xil_defaultlib -93 \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_Operationswerk_0_0/sim/SimulationBD_Automat_Operationswerk_0_0.vhd" \

vlog -work xlconcat_v2_1_4  -v2k5 \
"../../../../../TGI_II_UE4/TGI_II_UE4.srcs/sources_1/bd/SimulationBD_Automat/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_xlconcat_0_0/sim/SimulationBD_Automat_xlconcat_0_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 \
"../../../../../TGI_II_UE4/TGI_II_UE4.srcs/sources_1/bd/SimulationBD_Automat/ipshared/3f90/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_util_vector_logic_0_0/sim/SimulationBD_Automat_util_vector_logic_0_0.v" \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_xlconcat_1_0/sim/SimulationBD_Automat_xlconcat_1_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_Steuerwerk_Moore_0_0/sim/SimulationBD_Automat_Steuerwerk_Moore_0_0.vhd" \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_circuit_Zaehler_3_0_0/sim/SimulationBD_Automat_circuit_Zaehler_3_0_0.vhd" \
"../../../bd/SimulationBD_Automat/ip/SimulationBD_Automat_circuit_or_0_0/sim/SimulationBD_Automat_circuit_or_0_0.vhd" \
"../../../bd/SimulationBD_Automat/sim/SimulationBD_Automat.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

