--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.3 (win64) Build 3173277 Wed Apr  7 05:07:49 MDT 2021
--Date        : Fri Jan 21 08:40:29 2022
--Host        : DESKTOP-7REPPQD running 64-bit major release  (build 9200)
--Command     : generate_target SimulationBD_VZ_wrapper.bd
--Design      : SimulationBD_VZ_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SimulationBD_VZ_wrapper is
  port (
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    COUNTER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CS : out STD_LOGIC_VECTOR ( 12 downto 0 );
    Done : out STD_LOGIC;
    INBUS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Sign : out STD_LOGIC;
    clk : in STD_LOGIC;
    k1_start : in STD_LOGIC;
    reset : in STD_LOGIC
  );
end SimulationBD_VZ_wrapper;

architecture STRUCTURE of SimulationBD_VZ_wrapper is
  component SimulationBD_VZ is
  port (
    reset : in STD_LOGIC;
    k1_start : in STD_LOGIC;
    INBUS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Sign : out STD_LOGIC;
    Done : out STD_LOGIC;
    COUNTER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    clk : in STD_LOGIC;
    CS : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component SimulationBD_VZ;
begin
SimulationBD_VZ_i: component SimulationBD_VZ
     port map (
      A(3 downto 0) => A(3 downto 0),
      COUNTER(1 downto 0) => COUNTER(1 downto 0),
      CS(12 downto 0) => CS(12 downto 0),
      Done => Done,
      INBUS(3 downto 0) => INBUS(3 downto 0),
      M(3 downto 0) => M(3 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      Sign => Sign,
      clk => clk,
      k1_start => k1_start,
      reset => reset
    );
end STRUCTURE;
