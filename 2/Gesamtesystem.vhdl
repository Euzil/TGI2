--Definition of the required components

Library IEEE;
use IEEE.std_logic_1164.all;

entity D_CL_ET_FF is
port
(
D,Clock : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end D_CL_ET_FF;

architecture behavior of D_CL_ET_FF is 
  signal Q_intern : STD_LOGIC := '0';
begin
  D_FF_process : process(D, Clock, Q_intern)
  begin
    if rising_edge(Clock) then
      Q_intern <= D;
    end if;
  end process;
  Q     <=     Q_intern;
  Q_inv <= not Q_intern;
end behavior;

Library IEEE;
use IEEE.std_logic_1164.all;

entity AND_3 is
  port
  (
   in0,in1,in2 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end AND_3;

architecture dataflow of AND_3 is 
begin
  out0 <= in0 and in1 and in2;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity AND_4 is
  port
  (
   in0,in1,in2,in3 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end AND_4;

architecture dataflow of AND_4 is 
begin
  out0 <= in0 and in1 and in2 and in3;
end dataflow;

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

Library IEEE;
use IEEE.std_logic_1164.all;

entity DelayOne is
port
(
in0 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end DelayOne;

architecture dataflow of DelayOne is 
begin
out0 <= in0;
end dataflow;

Library IEEE;
use IEEE.std_logic_1164.all;

entity D_CL_Reset_FF is
port
(
D,Clock,Reset : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end D_CL_Reset_FF;

architecture behavior of D_CL_Reset_FF is 
  signal Q_intern : STD_LOGIC := '0';
begin
  D_FF_process : process(D, Clock, Q_intern, Reset)
  begin
    if Clock = '1' then
      Q_intern <= D;
    end if;
    if Reset = '1' then  -- Set
      Q_intern <= '0';
    end if;
  end process;
  Q     <=     Q_intern;
  Q_inv <= not Q_intern;
end behavior;

-- Circuit entity

Library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_Gesamteszstem is
  port
  (
   sig_in_Reset,  sig_in_InCent,  sig_in_InEuro,  sig_in_Takt : in STD_LOGIC;
  sig_out_Getraenke : out STD_LOGIC;
  sig_out_Rueckgabe : out STD_LOGIC
  );
end circuit_Gesamteszstem;

-- Structural description of the circuit

architecture structure of circuit_Gesamteszstem is

component D_CL_ET_FF
port
(
D,Clock : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end component;

component AND_3
  port
  (
   in0,in1,in2 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component AND_4
  port
  (
   in0,in1,in2,in3 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

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

component OR_3
  port
  (
   in0,in1,in2 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component DelayOne
port
(
in0 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end component;

component D_CL_Reset_FF
port
(
D,Clock,Reset : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end component;

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , AndGate2_out0 , AndGate2_out0_inverted , AndGate3_out0 , AndGate3_out0_inverted , AndGate4_out0 , AndGate4_out0_inverted , AndGate5_out0 , AndGate5_out0_inverted , AndGate6_out0 , AndGate6_out0_inverted , AndGate7_out0 , AndGate7_out0_inverted , AndGate8_out0 , AndGate8_out0_inverted , AndGate9_out0 , AndGate9_out0_inverted , AndGate10_out0 , AndGate10_out0_inverted , OrGate0_out0 , OrGate0_out0_inverted , OrGate1_out0 , OrGate1_out0_inverted , DFlipFlop0_out0 , DFlipFlop0_out0_inverted , DFlipFlop0_out1 , DFlipFlop0_out1_inverted , DFlipFlop1_out0 , DFlipFlop1_out0_inverted , DFlipFlop1_out1 , DFlipFlop1_out1_inverted , DFlipFlop2_out0 , DFlipFlop2_out0_inverted , DFlipFlop2_out1 , DFlipFlop2_out1_inverted , DFlipFlop3_out0 , DFlipFlop3_out0_inverted , DFlipFlop3_out1 , DFlipFlop3_out1_inverted , DFlipFlop4_out0 , DFlipFlop4_out0_inverted , DFlipFlop4_out1 , DFlipFlop4_out1_inverted , DFlipFlop5_out0 , DFlipFlop5_out0_inverted , DFlipFlop5_out1 , DFlipFlop5_out1_inverted , DFlipFlop6_out0 , DFlipFlop6_out0_inverted , DFlipFlop6_out1 , DFlipFlop6_out1_inverted , DelayOne0_out0 , DelayOne0_out0_inverted , DelayOne1_out0 , DelayOne1_out0_inverted : STD_LOGIC;
signal sig_in_Reset_inverted, sig_in_InCent_inverted, sig_in_InEuro_inverted, sig_in_Takt_inverted : STD_LOGIC;

begin
AndGate0 : AND_3
 port map (
  in0 => DFlipFlop2_out0,
  in1 => DFlipFlop6_out0,
  in2 =>  sig_in_Reset_inverted,
  out0 => AndGate0_out0);

AndGate1 : AND_4
 port map (
  in0 => DFlipFlop1_out0,
  in1 => DFlipFlop2_out0_inverted,
  in2 => DFlipFlop4_out0_inverted,
  in3 =>  sig_in_Reset_inverted,
  out0 => AndGate1_out0);

AndGate2 : AND_3
 port map (
  in0 => DFlipFlop1_out0_inverted,
  in1 => DFlipFlop4_out0,
  in2 =>  sig_in_Reset_inverted,
  out0 => AndGate2_out0);

AndGate3 : AND_4
 port map (
  in0 => DFlipFlop1_out0_inverted,
  in1 => DFlipFlop2_out0,
  in2 => DFlipFlop6_out0_inverted,
  in3 =>  sig_in_Reset_inverted,
  out0 => AndGate3_out0);

AndGate4 : AND_3
 port map (
  in0 => DFlipFlop1_out0,
  in1 => DFlipFlop4_out0,
  in2 =>  sig_in_Reset_inverted,
  out0 => AndGate4_out0);

AndGate5 : AND_3
 port map (
  in0 => DFlipFlop2_out0_inverted,
  in1 => DFlipFlop6_out0,
  in2 =>  sig_in_Reset_inverted,
  out0 => AndGate5_out0);

AndGate6 : AND_2
 port map (
  in0 => DFlipFlop1_out0,
  in1 => DFlipFlop2_out0,
  out0 => AndGate6_out0);

AndGate7 : AND_2
 port map (
  in0 =>  sig_in_InCent,
  in1 => DFlipFlop3_out0,
  out0 => AndGate7_out0);

AndGate8 : AND_2
 port map (
  in0 =>  sig_in_InCent,
  in1 => AndGate7_out0_inverted,
  out0 => AndGate8_out0);

AndGate9 : AND_2
 port map (
  in0 =>  sig_in_InEuro,
  in1 => DFlipFlop5_out0,
  out0 => AndGate9_out0);

AndGate10 : AND_2
 port map (
  in0 =>  sig_in_InEuro,
  in1 => AndGate9_out0_inverted,
  out0 => AndGate10_out0);

OrGate0 : OR_2
 port map (
  in0 => AndGate1_out0,
  in1 => AndGate2_out0,
  out0 => OrGate0_out0);

OrGate1 : OR_3
 port map (
  in0 => AndGate3_out0,
  in1 => AndGate4_out0,
  in2 => AndGate5_out0,
  out0 => OrGate1_out0);

DFlipFlop0 : D_CL_ET_FF
 port map (
  D => AndGate0_out0,
  Clock =>  sig_in_Takt,
  Q => DFlipFlop0_out0,
  Q_inv => DFlipFlop0_out1);

DFlipFlop1 : D_CL_ET_FF
 port map (
  D => OrGate0_out0,
  Clock =>  sig_in_Takt,
  Q => DFlipFlop1_out0,
  Q_inv => DFlipFlop1_out1);

DFlipFlop2 : D_CL_ET_FF
 port map (
  D => OrGate1_out0,
  Clock =>  sig_in_Takt,
  Q => DFlipFlop2_out0,
  Q_inv => DFlipFlop2_out1);

DFlipFlop3 : D_CL_Reset_FF
 port map (
  D =>  sig_in_InCent,
  Clock => DelayOne0_out0_inverted,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop3_out0,
  Q_inv => DFlipFlop3_out1);

DFlipFlop4 : D_CL_Reset_FF
 port map (
  D => AndGate8_out0,
  Clock => DelayOne0_out0_inverted,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop4_out0,
  Q_inv => DFlipFlop4_out1);

DFlipFlop5 : D_CL_Reset_FF
 port map (
  D =>  sig_in_InEuro,
  Clock => DelayOne1_out0_inverted,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop5_out0,
  Q_inv => DFlipFlop5_out1);

DFlipFlop6 : D_CL_Reset_FF
 port map (
  D => AndGate10_out0,
  Clock => DelayOne1_out0_inverted,
  Reset =>  sig_in_Reset,
  Q => DFlipFlop6_out0,
  Q_inv => DFlipFlop6_out1);

DelayOne0 : DelayOne
 port map (
  in0 =>  sig_in_Takt,
  out0 => DelayOne0_out0);

DelayOne1 : DelayOne
 port map (
  in0 =>  sig_in_Takt,
  out0 => DelayOne1_out0);

--Signal mapping
sig_out_Getraenke <= AndGate6_out0;
sig_out_Rueckgabe <= DFlipFlop0_out0;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
DFlipFlop2_out0_inverted <=  not DFlipFlop2_out0;
DFlipFlop4_out0_inverted <=  not DFlipFlop4_out0;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
DFlipFlop1_out0_inverted <=  not DFlipFlop1_out0;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
DFlipFlop1_out0_inverted <=  not DFlipFlop1_out0;
DFlipFlop6_out0_inverted <=  not DFlipFlop6_out0;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
DFlipFlop2_out0_inverted <=  not DFlipFlop2_out0;
 sig_in_Reset_inverted <=  not  sig_in_Reset;
AndGate7_out0_inverted <=  not AndGate7_out0;
AndGate9_out0_inverted <=  not AndGate9_out0;
DelayOne0_out0_inverted <=  not DelayOne0_out0;
DelayOne0_out0_inverted <=  not DelayOne0_out0;
DelayOne1_out0_inverted <=  not DelayOne1_out0;
DelayOne1_out0_inverted <=  not DelayOne1_out0;
end structure;
