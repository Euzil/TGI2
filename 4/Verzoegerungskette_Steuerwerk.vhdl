--Definition of the required components

Library IEEE;
use IEEE.std_logic_1164.all;

entity AND_2 is
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end AND_2;

architecture dataflow of AND_2 is
begin
  out0 <= in0 and in1;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity OR_2 is
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end OR_2;

architecture dataflow of OR_2 is
begin
  out0 <= in0 or in1;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity D_CL_ET_Reset_FF is
port
(
D,Clock,Reset : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end D_CL_ET_Reset_FF;

architecture behavior of D_CL_ET_Reset_FF is
  signal Q_intern : STD_LOGIC := '0';
begin
  D_FF_process : process(D, Clock, Q_intern, Reset)
  begin
    if rising_edge(Clock) then
      Q_intern <= D;
    end if;
    if Reset = '1' then  -- Set
      Q_intern <= '0';
    end if;
  end process;
  Q     <=     Q_intern;
  Q_inv <= not Q_intern;
end behavior;

Library IEEE;
use IEEE.std_logic_1164.all;

entity OR_4 is
  port
  (
   in0,in1,in2,in3 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end OR_4;

architecture dataflow of OR_4 is
begin
  out0 <= in0 or in1 or in2 or in3;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity OR_3 is
  port
  (
   in0,in1,in2 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end OR_3;

architecture dataflow of OR_3 is
begin
  out0 <= in0 or in1 or in2;
end dataflow;

-- Circuit entity

Library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_Verzoegerungskette_Steuerwerk is
  port
  (
   sig_in_k1,  sig_in_Takt,  sig_in_k2,  sig_in_k3,  sig_in_reset : in STD_LOGIC;
  sig_out_c11 : out STD_LOGIC;
  sig_out_c10 : out STD_LOGIC;
  sig_out_c9 : out STD_LOGIC;
  sig_out_c8 : out STD_LOGIC;
  sig_out_c7 : out STD_LOGIC;
  sig_out_c6 : out STD_LOGIC;
  sig_out_c5 : out STD_LOGIC;
  sig_out_c4 : out STD_LOGIC;
  sig_out_c3 : out STD_LOGIC;
  sig_out_c2 : out STD_LOGIC;
  sig_out_c1 : out STD_LOGIC;
  sig_out_c0 : out STD_LOGIC;
  sig_out_c12 : out STD_LOGIC;
  sig_out_DONE : out STD_LOGIC
  );
end circuit_Verzoegerungskette_Steuerwerk;

-- Structural description of the circuit

architecture structure of circuit_Verzoegerungskette_Steuerwerk is

component AND_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component OR_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component D_CL_ET_Reset_FF
port
(
D,Clock,Reset : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end component;

component OR_4
  port
  (
   in0,in1,in2,in3 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component OR_3
  port
  (
   in0,in1,in2 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , AndGate2_out0 , AndGate2_out0_inverted , AndGate3_out0 , AndGate3_out0_inverted , OrGate0_out0 , OrGate0_out0_inverted , OrGate1_out0 , OrGate1_out0_inverted , OrGate2_out0 , OrGate2_out0_inverted , OrGate3_out0 , OrGate3_out0_inverted , OrGate4_out0 , OrGate4_out0_inverted , OrGate5_out0 , OrGate5_out0_inverted , DFlipFlop0_out0 , DFlipFlop0_out0_inverted , DFlipFlop0_out1 , DFlipFlop0_out1_inverted , DFlipFlop1_out0 , DFlipFlop1_out0_inverted , DFlipFlop1_out1 , DFlipFlop1_out1_inverted , DFlipFlop2_out0 , DFlipFlop2_out0_inverted , DFlipFlop2_out1 , DFlipFlop2_out1_inverted , DFlipFlop3_out0 , DFlipFlop3_out0_inverted , DFlipFlop3_out1 , DFlipFlop3_out1_inverted , DFlipFlop4_out0 , DFlipFlop4_out0_inverted , DFlipFlop4_out1 , DFlipFlop4_out1_inverted , DFlipFlop5_out0 , DFlipFlop5_out0_inverted , DFlipFlop5_out1 , DFlipFlop5_out1_inverted , DFlipFlop6_out0 , DFlipFlop6_out0_inverted , DFlipFlop6_out1 , DFlipFlop6_out1_inverted , DFlipFlop7_out0 , DFlipFlop7_out0_inverted , DFlipFlop7_out1 , DFlipFlop7_out1_inverted , DFlipFlop8_out0 , DFlipFlop8_out0_inverted , DFlipFlop8_out1 , DFlipFlop8_out1_inverted : STD_LOGIC;
signal sig_in_k1_inverted, sig_in_Takt_inverted, sig_in_k2_inverted, sig_in_k3_inverted, sig_in_reset_inverted : STD_LOGIC;

begin
AndGate0 : AND_2
 port map (
  in0 =>  sig_in_k2,
  in1 => DFlipFlop4_out0,
  out0 => AndGate0_out0);

AndGate1 : AND_2
 port map (
  in0 =>  sig_in_k2_inverted,
  in1 => DFlipFlop4_out0,
  out0 => AndGate1_out0);

AndGate2 : AND_2
 port map (
  in0 =>  sig_in_k3,
  in1 => OrGate0_out0,
  out0 => AndGate2_out0);

AndGate3 : AND_2
 port map (
  in0 => OrGate0_out0,
  in1 =>  sig_in_k3_inverted,
  out0 => AndGate3_out0);

OrGate0 : OR_2
 port map (
  in0 => DFlipFlop5_out0,
  in1 => DFlipFlop6_out0,
  out0 => OrGate0_out0);

OrGate1 : OR_2
 port map (
  in0 => AndGate3_out0,
  in1 => DFlipFlop2_out0,
  out0 => OrGate1_out0);

OrGate2 : OR_4
 port map (
  in0 => DFlipFlop5_out0,
  in1 => DFlipFlop0_out0,
  in2 => DFlipFlop4_out0,
  in3 => DFlipFlop3_out0,
  out0 => OrGate2_out0);

OrGate3 : OR_2
 port map (
  in0 => DFlipFlop4_out0,
  in1 => DFlipFlop5_out0,
  out0 => OrGate3_out0);

OrGate4 : OR_3
 port map (
  in0 => DFlipFlop3_out0,
  in1 => DFlipFlop6_out0,
  in2 => DFlipFlop1_out0,
  out0 => OrGate4_out0);

OrGate5 : OR_3
 port map (
  in0 => DFlipFlop5_out0,
  in1 => DFlipFlop4_out0,
  in2 => DFlipFlop3_out0,
  out0 => OrGate5_out0);

DFlipFlop0 : D_CL_ET_Reset_FF
 port map (
  D =>  sig_in_k1,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop0_out0,
  Q_inv => DFlipFlop0_out1);

DFlipFlop1 : D_CL_ET_Reset_FF
 port map (
  D => DFlipFlop0_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop1_out0,
  Q_inv => DFlipFlop1_out1);

DFlipFlop2 : D_CL_ET_Reset_FF
 port map (
  D => DFlipFlop1_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop2_out0,
  Q_inv => DFlipFlop2_out1);

DFlipFlop3 : D_CL_ET_Reset_FF
 port map (
  D => OrGate1_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop3_out0,
  Q_inv => DFlipFlop3_out1);

DFlipFlop4 : D_CL_ET_Reset_FF
 port map (
  D => DFlipFlop3_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop4_out0,
  Q_inv => DFlipFlop4_out1);

DFlipFlop5 : D_CL_ET_Reset_FF
 port map (
  D => AndGate0_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop5_out0,
  Q_inv => DFlipFlop5_out1);

DFlipFlop6 : D_CL_ET_Reset_FF
 port map (
  D => AndGate1_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop6_out0,
  Q_inv => DFlipFlop6_out1);

DFlipFlop7 : D_CL_ET_Reset_FF
 port map (
  D => AndGate2_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop7_out0,
  Q_inv => DFlipFlop7_out1);

DFlipFlop8 : D_CL_ET_Reset_FF
 port map (
  D => DFlipFlop7_out0,
  Clock =>  sig_in_Takt,
  Reset =>  sig_in_reset,
  Q => DFlipFlop8_out0,
  Q_inv => DFlipFlop8_out1);

--Signal mapping
sig_out_c11 <= OrGate4_out0;
sig_out_c10 <= DFlipFlop7_out0;
sig_out_c9 <= OrGate3_out0;
sig_out_c8 <= DFlipFlop3_out0;
sig_out_c7 <= DFlipFlop0_out0;
sig_out_c6 <= DFlipFlop3_out0;
sig_out_c5 <= OrGate2_out0;
sig_out_c4 <= DFlipFlop1_out0;
sig_out_c3 <= DFlipFlop2_out0;
sig_out_c2 <= OrGate5_out0;
sig_out_c1 <= DFlipFlop0_out0;
sig_out_c0 <= DFlipFlop4_out0;
sig_out_c12 <= DFlipFlop3_out0;
sig_out_DONE <= DFlipFlop8_out0;
 sig_in_k2_inverted <=  not  sig_in_k2;
 sig_in_k3_inverted <=  not  sig_in_k3;
end structure;
