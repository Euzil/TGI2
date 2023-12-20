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

-- IP VLNV: xilinx.com:module_ref:Operationswerk:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SimulationBD_Automat_Operationswerk_0_0 IS
  PORT (
    clock : IN STD_LOGIC;
    INBUS : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTBUS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    c0 : IN STD_LOGIC;
    c2 : IN STD_LOGIC;
    c3 : IN STD_LOGIC;
    c4 : IN STD_LOGIC;
    c5 : IN STD_LOGIC;
    c6 : IN STD_LOGIC;
    c7 : IN STD_LOGIC;
    c9 : IN STD_LOGIC;
    c10 : IN STD_LOGIC;
    c11 : IN STD_LOGIC;
    c12 : IN STD_LOGIC;
    k2 : OUT STD_LOGIC;
    A_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    Q_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    M_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    S_out : OUT STD_LOGIC
  );
END SimulationBD_Automat_Operationswerk_0_0;

ARCHITECTURE SimulationBD_Automat_Operationswerk_0_0_arch OF SimulationBD_Automat_Operationswerk_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SimulationBD_Automat_Operationswerk_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT Operationswerk IS
    GENERIC (
      DATA_WIDTH : INTEGER
    );
    PORT (
      clock : IN STD_LOGIC;
      INBUS : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      OUTBUS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      c0 : IN STD_LOGIC;
      c2 : IN STD_LOGIC;
      c3 : IN STD_LOGIC;
      c4 : IN STD_LOGIC;
      c5 : IN STD_LOGIC;
      c6 : IN STD_LOGIC;
      c7 : IN STD_LOGIC;
      c9 : IN STD_LOGIC;
      c10 : IN STD_LOGIC;
      c11 : IN STD_LOGIC;
      c12 : IN STD_LOGIC;
      k2 : OUT STD_LOGIC;
      A_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      Q_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      M_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      S_out : OUT STD_LOGIC
    );
  END COMPONENT Operationswerk;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF SimulationBD_Automat_Operationswerk_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clock: SIGNAL IS "XIL_INTERFACENAME clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clock: SIGNAL IS "xilinx.com:signal:clock:1.0 clock CLK";
BEGIN
  U0 : Operationswerk
    GENERIC MAP (
      DATA_WIDTH => 4
    )
    PORT MAP (
      clock => clock,
      INBUS => INBUS,
      OUTBUS => OUTBUS,
      c0 => c0,
      c2 => c2,
      c3 => c3,
      c4 => c4,
      c5 => c5,
      c6 => c6,
      c7 => c7,
      c9 => c9,
      c10 => c10,
      c11 => c11,
      c12 => c12,
      k2 => k2,
      A_out => A_out,
      Q_out => Q_out,
      M_out => M_out,
      S_out => S_out
    );
END SimulationBD_Automat_Operationswerk_0_0_arch;
