
################################################################
# This is a generated script based on design: SimulationBD_Automat
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source SimulationBD_Automat_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# Operationswerk, Steuerwerk_Moore, circuit_Zaehler_3, circuit_or

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvc1802-viva1596-1LHP-i-L
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name SimulationBD_Automat

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set A [ create_bd_port -dir O -from 3 -to 0 A ]
  set COUNTER [ create_bd_port -dir O -from 1 -to 0 COUNTER ]
  set CS [ create_bd_port -dir O -from 12 -to 0 CS ]
  set Done [ create_bd_port -dir O Done ]
  set INBUS [ create_bd_port -dir I -from 3 -to 0 INBUS ]
  set M [ create_bd_port -dir O -from 3 -to 0 M ]
  set Q [ create_bd_port -dir O -from 3 -to 0 Q ]
  set Sign [ create_bd_port -dir O Sign ]
  set clk [ create_bd_port -dir I clk ]
  set k1_start [ create_bd_port -dir I k1_start ]
  set reset [ create_bd_port -dir I reset ]

  # Create instance: Operationswerk_0, and set properties
  set block_name Operationswerk
  set block_cell_name Operationswerk_0
  if { [catch {set Operationswerk_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Operationswerk_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Steuerwerk_Moore_0, and set properties
  set block_name Steuerwerk_Moore
  set block_cell_name Steuerwerk_Moore_0
  if { [catch {set Steuerwerk_Moore_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Steuerwerk_Moore_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: circuit_Zaehler_3_0, and set properties
  set block_name circuit_Zaehler_3
  set block_cell_name circuit_Zaehler_3_0
  if { [catch {set circuit_Zaehler_3_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $circuit_Zaehler_3_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: circuit_or_0, and set properties
  set block_name circuit_or
  set block_cell_name circuit_or_0
  if { [catch {set circuit_or_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $circuit_or_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {13} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {2} \
 ] $xlconcat_1

  # Create port connections
  connect_bd_net -net INBUS_1 [get_bd_ports INBUS] [get_bd_pins Operationswerk_0/INBUS]
  connect_bd_net -net Operationswerk_0_A_out [get_bd_ports A] [get_bd_pins Operationswerk_0/A_out]
  connect_bd_net -net Operationswerk_0_M_out [get_bd_ports M] [get_bd_pins Operationswerk_0/M_out]
  connect_bd_net -net Operationswerk_0_Q_out [get_bd_ports Q] [get_bd_pins Operationswerk_0/Q_out]
  connect_bd_net -net Operationswerk_0_S_out [get_bd_ports Sign] [get_bd_pins Operationswerk_0/S_out]
  connect_bd_net -net Operationswerk_0_k2 [get_bd_pins Operationswerk_0/k2] [get_bd_pins Steuerwerk_Moore_0/k2]
  connect_bd_net -net Steuerwerk_Moore_0_DONE [get_bd_ports Done] [get_bd_pins Steuerwerk_Moore_0/DONE]
  connect_bd_net -net Steuerwerk_Moore_0_c0 [get_bd_pins Operationswerk_0/c0] [get_bd_pins Steuerwerk_Moore_0/c0] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net Steuerwerk_Moore_0_c1 [get_bd_pins Steuerwerk_Moore_0/c1] [get_bd_pins circuit_or_0/sig_in_0] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net Steuerwerk_Moore_0_c2 [get_bd_pins Operationswerk_0/c2] [get_bd_pins Steuerwerk_Moore_0/c2] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net Steuerwerk_Moore_0_c3 [get_bd_pins Operationswerk_0/c3] [get_bd_pins Steuerwerk_Moore_0/c3] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net Steuerwerk_Moore_0_c4 [get_bd_pins Operationswerk_0/c4] [get_bd_pins Steuerwerk_Moore_0/c4] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net Steuerwerk_Moore_0_c5 [get_bd_pins Operationswerk_0/c5] [get_bd_pins Steuerwerk_Moore_0/c5] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net Steuerwerk_Moore_0_c6 [get_bd_pins Operationswerk_0/c6] [get_bd_pins Steuerwerk_Moore_0/c6] [get_bd_pins xlconcat_0/In6]
  connect_bd_net -net Steuerwerk_Moore_0_c7 [get_bd_pins Operationswerk_0/c7] [get_bd_pins Steuerwerk_Moore_0/c7] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net Steuerwerk_Moore_0_c8 [get_bd_pins Steuerwerk_Moore_0/c8] [get_bd_pins circuit_Zaehler_3_0/sig_in_incCnt] [get_bd_pins xlconcat_0/In8]
  connect_bd_net -net Steuerwerk_Moore_0_c9 [get_bd_pins Operationswerk_0/c9] [get_bd_pins Steuerwerk_Moore_0/c9] [get_bd_pins xlconcat_0/In9]
  connect_bd_net -net Steuerwerk_Moore_0_c10 [get_bd_pins Operationswerk_0/c10] [get_bd_pins Steuerwerk_Moore_0/c10] [get_bd_pins xlconcat_0/In10]
  connect_bd_net -net Steuerwerk_Moore_0_c11 [get_bd_pins Operationswerk_0/c11] [get_bd_pins Steuerwerk_Moore_0/c11] [get_bd_pins xlconcat_0/In11]
  connect_bd_net -net Steuerwerk_Moore_0_c12 [get_bd_pins Operationswerk_0/c12] [get_bd_pins Steuerwerk_Moore_0/c12] [get_bd_pins xlconcat_0/In12]
  connect_bd_net -net circuit_Zaehler_3_0_sig_out_Q0 [get_bd_pins circuit_Zaehler_3_0/sig_out_Q0] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net circuit_Zaehler_3_0_sig_out_Q1 [get_bd_pins circuit_Zaehler_3_0/sig_out_Q1] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net circuit_Zaehler_3_0_sig_out_null [get_bd_pins Steuerwerk_Moore_0/k3] [get_bd_pins circuit_Zaehler_3_0/sig_out_null]
  connect_bd_net -net circuit_or_0_sig_out_0 [get_bd_pins circuit_Zaehler_3_0/sig_in_Reset] [get_bd_pins circuit_or_0/sig_out_0]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins Steuerwerk_Moore_0/clock] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net k1_start_1 [get_bd_ports k1_start] [get_bd_pins Steuerwerk_Moore_0/k1]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins Steuerwerk_Moore_0/reset] [get_bd_pins circuit_or_0/sig_in_1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins Operationswerk_0/clock] [get_bd_pins circuit_Zaehler_3_0/sig_in_Text] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconcat_0_dout [get_bd_ports CS] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_ports COUNTER] [get_bd_pins xlconcat_1/dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


