-- (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:circuit_Verzoerung_2:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SimulationBD_VZ_circuit_Verzoerung_2_0_0 IS
  PORT (
    sig_in_k1 : IN STD_LOGIC;
    sig_in_Takt : IN STD_LOGIC;
    sig_in_k2 : IN STD_LOGIC;
    sig_in_k3 : IN STD_LOGIC;
    sig_in_reset : IN STD_LOGIC;
    sig_out_c11 : OUT STD_LOGIC;
    sig_out_c10 : OUT STD_LOGIC;
    sig_out_c9 : OUT STD_LOGIC;
    sig_out_c8 : OUT STD_LOGIC;
    sig_out_c7 : OUT STD_LOGIC;
    sig_out_c6 : OUT STD_LOGIC;
    sig_out_c5 : OUT STD_LOGIC;
    sig_out_c4 : OUT STD_LOGIC;
    sig_out_c3 : OUT STD_LOGIC;
    sig_out_c2 : OUT STD_LOGIC;
    sig_out_c1 : OUT STD_LOGIC;
    sig_out_c0 : OUT STD_LOGIC;
    sig_out_c12 : OUT STD_LOGIC;
    sig_out_DONE : OUT STD_LOGIC
  );
END SimulationBD_VZ_circuit_Verzoerung_2_0_0;

ARCHITECTURE SimulationBD_VZ_circuit_Verzoerung_2_0_0_arch OF SimulationBD_VZ_circuit_Verzoerung_2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SimulationBD_VZ_circuit_Verzoerung_2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT circuit_Verzoerung_2 IS
    PORT (
      sig_in_k1 : IN STD_LOGIC;
      sig_in_Takt : IN STD_LOGIC;
      sig_in_k2 : IN STD_LOGIC;
      sig_in_k3 : IN STD_LOGIC;
      sig_in_reset : IN STD_LOGIC;
      sig_out_c11 : OUT STD_LOGIC;
      sig_out_c10 : OUT STD_LOGIC;
      sig_out_c9 : OUT STD_LOGIC;
      sig_out_c8 : OUT STD_LOGIC;
      sig_out_c7 : OUT STD_LOGIC;
      sig_out_c6 : OUT STD_LOGIC;
      sig_out_c5 : OUT STD_LOGIC;
      sig_out_c4 : OUT STD_LOGIC;
      sig_out_c3 : OUT STD_LOGIC;
      sig_out_c2 : OUT STD_LOGIC;
      sig_out_c1 : OUT STD_LOGIC;
      sig_out_c0 : OUT STD_LOGIC;
      sig_out_c12 : OUT STD_LOGIC;
      sig_out_DONE : OUT STD_LOGIC
    );
  END COMPONENT circuit_Verzoerung_2;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF SimulationBD_VZ_circuit_Verzoerung_2_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF sig_in_reset: SIGNAL IS "XIL_INTERFACENAME sig_in_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF sig_in_reset: SIGNAL IS "xilinx.com:signal:reset:1.0 sig_in_reset RST";
BEGIN
  U0 : circuit_Verzoerung_2
    PORT MAP (
      sig_in_k1 => sig_in_k1,
      sig_in_Takt => sig_in_Takt,
      sig_in_k2 => sig_in_k2,
      sig_in_k3 => sig_in_k3,
      sig_in_reset => sig_in_reset,
      sig_out_c11 => sig_out_c11,
      sig_out_c10 => sig_out_c10,
      sig_out_c9 => sig_out_c9,
      sig_out_c8 => sig_out_c8,
      sig_out_c7 => sig_out_c7,
      sig_out_c6 => sig_out_c6,
      sig_out_c5 => sig_out_c5,
      sig_out_c4 => sig_out_c4,
      sig_out_c3 => sig_out_c3,
      sig_out_c2 => sig_out_c2,
      sig_out_c1 => sig_out_c1,
      sig_out_c0 => sig_out_c0,
      sig_out_c12 => sig_out_c12,
      sig_out_DONE => sig_out_DONE
    );
END SimulationBD_VZ_circuit_Verzoerung_2_0_0_arch;
