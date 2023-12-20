--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Fri Jan  8 16:09:40 2021
--Host        : DESKTOP-G7LS33N running 64-bit major release  (build 9200)
--Command     : generate_target ExerciseBD_VZ_wrapper.bd
--Design      : ExerciseBD_VZ_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ExerciseBD_VZ_wrapper is
  port (
    AN0 : out STD_LOGIC;
    AN1 : out STD_LOGIC;
    AN2 : out STD_LOGIC;
    AN3 : out STD_LOGIC;
    BTNC : in STD_LOGIC;
    BTND : in STD_LOGIC;
    BTNL : in STD_LOGIC;
    BTNR : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    CA : out STD_LOGIC_VECTOR ( 0 to 0 );
    CB : out STD_LOGIC_VECTOR ( 0 to 0 );
    CC : out STD_LOGIC_VECTOR ( 0 to 0 );
    CD : out STD_LOGIC_VECTOR ( 0 to 0 );
    CE : out STD_LOGIC_VECTOR ( 0 to 0 );
    CF : out STD_LOGIC_VECTOR ( 0 to 0 );
    CG : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC;
    DP : out STD_LOGIC_VECTOR ( 0 to 0 );
    LD0 : out STD_LOGIC;
    LD1 : out STD_LOGIC;
    LD10 : out STD_LOGIC;
    LD11 : out STD_LOGIC;
    LD12 : out STD_LOGIC;
    LD13 : out STD_LOGIC_VECTOR ( 0 to 0 );
    LD14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    LD15 : out STD_LOGIC;
    LD2 : out STD_LOGIC;
    LD3 : out STD_LOGIC;
    LD4 : out STD_LOGIC;
    LD5 : out STD_LOGIC;
    LD6 : out STD_LOGIC;
    LD7 : out STD_LOGIC;
    LD8 : out STD_LOGIC;
    LD9 : out STD_LOGIC;
    SW0 : in STD_LOGIC;
    SW1 : in STD_LOGIC;
    SW10 : in STD_LOGIC;
    SW11 : in STD_LOGIC;
    SW12 : in STD_LOGIC;
    SW13 : in STD_LOGIC;
    SW14 : in STD_LOGIC;
    SW15 : in STD_LOGIC;
    SW2 : in STD_LOGIC;
    SW3 : in STD_LOGIC;
    SW4 : in STD_LOGIC;
    SW5 : in STD_LOGIC;
    SW6 : in STD_LOGIC;
    SW7 : in STD_LOGIC;
    SW8 : in STD_LOGIC;
    SW9 : in STD_LOGIC
  );
end ExerciseBD_VZ_wrapper;

architecture STRUCTURE of ExerciseBD_VZ_wrapper is
  component ExerciseBD_VZ is
  port (
    BTNR : in STD_LOGIC;
    BTNC : in STD_LOGIC;
    BTNU : in STD_LOGIC;
    SW14 : in STD_LOGIC;
    SW13 : in STD_LOGIC;
    SW12 : in STD_LOGIC;
    BTNL : in STD_LOGIC;
    SW6 : in STD_LOGIC;
    SW7 : in STD_LOGIC;
    SW8 : in STD_LOGIC;
    SW9 : in STD_LOGIC;
    SW10 : in STD_LOGIC;
    SW11 : in STD_LOGIC;
    SW4 : in STD_LOGIC;
    BTND : in STD_LOGIC;
    CLK : in STD_LOGIC;
    AN0 : out STD_LOGIC;
    AN1 : out STD_LOGIC;
    AN2 : out STD_LOGIC;
    AN3 : out STD_LOGIC;
    CA : out STD_LOGIC_VECTOR ( 0 to 0 );
    CB : out STD_LOGIC_VECTOR ( 0 to 0 );
    CC : out STD_LOGIC_VECTOR ( 0 to 0 );
    CD : out STD_LOGIC_VECTOR ( 0 to 0 );
    CE : out STD_LOGIC_VECTOR ( 0 to 0 );
    CF : out STD_LOGIC_VECTOR ( 0 to 0 );
    CG : out STD_LOGIC_VECTOR ( 0 to 0 );
    DP : out STD_LOGIC_VECTOR ( 0 to 0 );
    SW15 : in STD_LOGIC;
    LD0 : out STD_LOGIC;
    LD1 : out STD_LOGIC;
    LD2 : out STD_LOGIC;
    LD3 : out STD_LOGIC;
    LD4 : out STD_LOGIC;
    LD5 : out STD_LOGIC;
    LD6 : out STD_LOGIC;
    LD7 : out STD_LOGIC;
    LD8 : out STD_LOGIC;
    LD9 : out STD_LOGIC;
    LD10 : out STD_LOGIC;
    LD11 : out STD_LOGIC;
    LD12 : out STD_LOGIC;
    SW0 : in STD_LOGIC;
    SW1 : in STD_LOGIC;
    SW2 : in STD_LOGIC;
    SW3 : in STD_LOGIC;
    LD13 : out STD_LOGIC_VECTOR ( 0 to 0 );
    LD14 : out STD_LOGIC_VECTOR ( 0 to 0 );
    LD15 : out STD_LOGIC;
    SW5 : in STD_LOGIC
  );
  end component ExerciseBD_VZ;
begin
ExerciseBD_VZ_i: component ExerciseBD_VZ
     port map (
      AN0 => AN0,
      AN1 => AN1,
      AN2 => AN2,
      AN3 => AN3,
      BTNC => BTNC,
      BTND => BTND,
      BTNL => BTNL,
      BTNR => BTNR,
      BTNU => BTNU,
      CA(0) => CA(0),
      CB(0) => CB(0),
      CC(0) => CC(0),
      CD(0) => CD(0),
      CE(0) => CE(0),
      CF(0) => CF(0),
      CG(0) => CG(0),
      CLK => CLK,
      DP(0) => DP(0),
      LD0 => LD0,
      LD1 => LD1,
      LD10 => LD10,
      LD11 => LD11,
      LD12 => LD12,
      LD13(0) => LD13(0),
      LD14(0) => LD14(0),
      LD15 => LD15,
      LD2 => LD2,
      LD3 => LD3,
      LD4 => LD4,
      LD5 => LD5,
      LD6 => LD6,
      LD7 => LD7,
      LD8 => LD8,
      LD9 => LD9,
      SW0 => SW0,
      SW1 => SW1,
      SW10 => SW10,
      SW11 => SW11,
      SW12 => SW12,
      SW13 => SW13,
      SW14 => SW14,
      SW15 => SW15,
      SW2 => SW2,
      SW3 => SW3,
      SW4 => SW4,
      SW5 => SW5,
      SW6 => SW6,
      SW7 => SW7,
      SW8 => SW8,
      SW9 => SW9
    );
end STRUCTURE;
