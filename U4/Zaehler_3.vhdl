--Definition of the required components

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

entity Exor_2 is
  port
  (
   in0, in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end Exor_2;

architecture dataflow of Exor_2 is 
begin
 out0 <= in0 xor in1;
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

-- Circuit entity

Library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_Zaehler_3 is
  port
  (
   sig_in_incCnt,  sig_in_Reset,  sig_in_Text : in STD_LOGIC;
  sig_out_Q0 : out STD_LOGIC;
  sig_out_Q1 : out STD_LOGIC;
  sig_out_null : out STD_LOGIC
  );
end circuit_Zaehler_3;

-- Structural description of the circuit

architecture structure of circuit_Zaehler_3 is

component D_CL_ET_Reset_FF
port
(
D,Clock,Reset : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end component;

component AND_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component Exor_2
  port
  (
   in0, in1 : in STD_LOGIC;
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

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , OrGate0_out0 , OrGate0_out0_inverted , XorGate0_out0 , XorGate0_out0_inverted , DFlipFlop0_out0 , DFlipFlop0_out0_inverted , DFlipFlop0_out1 , DFlipFlop0_out1_inverted , DFlipFlop1_out0 , DFlipFlop1_out0_inverted , DFlipFlop1_out1 , DFlipFlop1_out1_inverted : STD_LOGIC;
signal sig_in_incCnt_inverted, sig_in_Reset_inverted, sig_in_Text_inverted : STD_LOGIC;

begin
AndGate0 : AND_2
 port map (
  in0 =>  sig_in_Text,
  in1 =>  sig_in_incCnt,
  out0 => AndGate0_out0);

AndGate1 : AND_2
 port map (
  in0 => OrGate0_out0,
  in1 => OrGate0_out0,
  out0 => AndGate1_out0);

OrGate0 : OR_2
 port map (
  in0 => DFlipFlop0_out0,
  in1 => DFlipFlop1_out0,
  out0 => OrGate0_out0);

XorGate0 : Exor_2
 port map (
  in0 => DFlipFlop1_out0,
  in1 => DFlipFlop0_out0,
  out0 => XorGate0_out0);

DFlipFlop0 : D_CL_ET_Reset_FF
 port map (
  D => DFlipFlop0_out1,
  Clock => AndGate0_out0,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop0_out0,
  Q_inv => DFlipFlop0_out1);

DFlipFlop1 : D_CL_ET_Reset_FF
 port map (
  D => XorGate0_out0,
  Clock => AndGate0_out0,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop1_out0,
  Q_inv => DFlipFlop1_out1);

--Signal mapping
sig_out_Q0 <= DFlipFlop0_out0;
sig_out_Q1 <= DFlipFlop1_out0;
sig_out_null <= AndGate1_out0_inverted;
AndGate1_out0_inverted <=  not AndGate1_out0;
end structure;
