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

Library IEEE;
use IEEE.std_logic_1164.all;

entity OR_5 is
  port
  (
   in0,in1,in2,in3,in4 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end OR_5;

architecture dataflow of OR_5 is 
begin
  out0 <= in0 or in1 or in2 or in3 or in4;
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

entity circuit_VHDL is
  port
  (
   sig_in_X4,  sig_in_X3,  sig_in_X2,  sig_in_X1 : in STD_LOGIC;
  sig_out_a : out STD_LOGIC;
  sig_out_b : out STD_LOGIC;
  sig_out_c : out STD_LOGIC;
  sig_out_d : out STD_LOGIC;
  sig_out_e : out STD_LOGIC;
  sig_out_f : out STD_LOGIC;
  sig_out_g : out STD_LOGIC
  );
end circuit_VHDL;

-- Structural description of the circuit

architecture structure of circuit_VHDL is

component AND_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
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

component OR_5
  port
  (
   in0,in1,in2,in3,in4 : in STD_LOGIC;
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
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , AndGate2_out0 , AndGate2_out0_inverted , AndGate3_out0 , AndGate3_out0_inverted , AndGate4_out0 , AndGate4_out0_inverted , AndGate5_out0 , AndGate5_out0_inverted , AndGate6_out0 , AndGate6_out0_inverted , AndGate7_out0 , AndGate7_out0_inverted , AndGate8_out0 , AndGate8_out0_inverted , AndGate9_out0 , AndGate9_out0_inverted , AndGate10_out0 , AndGate10_out0_inverted , AndGate11_out0 , AndGate11_out0_inverted , AndGate12_out0 , AndGate12_out0_inverted , AndGate13_out0 , AndGate13_out0_inverted , AndGate14_out0 , AndGate14_out0_inverted , AndGate15_out0 , AndGate15_out0_inverted , AndGate16_out0 , AndGate16_out0_inverted , AndGate17_out0 , AndGate17_out0_inverted , AndGate18_out0 , AndGate18_out0_inverted , AndGate19_out0 , AndGate19_out0_inverted , AndGate20_out0 , AndGate20_out0_inverted , AndGate21_out0 , AndGate21_out0_inverted , AndGate22_out0 , AndGate22_out0_inverted , AndGate23_out0 , AndGate23_out0_inverted , AndGate24_out0 , AndGate24_out0_inverted , AndGate25_out0 , AndGate25_out0_inverted , OrGate0_out0 , OrGate0_out0_inverted , OrGate1_out0 , OrGate1_out0_inverted , OrGate2_out0 , OrGate2_out0_inverted , OrGate3_out0 , OrGate3_out0_inverted , OrGate4_out0 , OrGate4_out0_inverted , OrGate5_out0 , OrGate5_out0_inverted , OrGate6_out0 , OrGate6_out0_inverted : STD_LOGIC;
signal sig_in_X4_inverted, sig_in_X3_inverted, sig_in_X2_inverted, sig_in_X1_inverted : STD_LOGIC;

begin
AndGate0 : AND_2
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2,
  out0 => AndGate0_out0);

AndGate1 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  in2 =>  sig_in_X1,
  out0 => AndGate1_out0);

AndGate2 : AND_3
 port map (
  in0 =>  sig_in_X4,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate2_out0);

AndGate3 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate3_out0);

AndGate4 : AND_2
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3_inverted,
  out0 => AndGate4_out0);

AndGate5 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2_inverted,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate5_out0);

AndGate6 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2,
  in2 =>  sig_in_X1,
  out0 => AndGate6_out0);

AndGate7 : AND_2
 port map (
  in0 =>  sig_in_X3_inverted,
  in1 =>  sig_in_X2_inverted,
  out0 => AndGate7_out0);

AndGate8 : AND_2
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X1,
  out0 => AndGate8_out0);

AndGate9 : AND_2
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  out0 => AndGate9_out0);

AndGate10 : AND_2
 port map (
  in0 =>  sig_in_X3_inverted,
  in1 =>  sig_in_X2_inverted,
  out0 => AndGate10_out0);

AndGate11 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2,
  out0 => AndGate11_out0);

AndGate12 : AND_4
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  in2 =>  sig_in_X2_inverted,
  in3 =>  sig_in_X1,
  out0 => AndGate12_out0);

AndGate13 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate13_out0);

AndGate14 : AND_3
 port map (
  in0 =>  sig_in_X4,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate14_out0);

AndGate15 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate15_out0);

AndGate16 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate16_out0);

AndGate17 : AND_3
 port map (
  in0 =>  sig_in_X3_inverted,
  in1 =>  sig_in_X2_inverted,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate17_out0);

AndGate18 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate18_out0);

AndGate19 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate19_out0);

AndGate20 : AND_3
 port map (
  in0 =>  sig_in_X4,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate20_out0);

AndGate21 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2_inverted,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate21_out0);

AndGate22 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2,
  out0 => AndGate22_out0);

AndGate23 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X3,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate23_out0);

AndGate24 : AND_3
 port map (
  in0 =>  sig_in_X4,
  in1 =>  sig_in_X3_inverted,
  in2 =>  sig_in_X2_inverted,
  out0 => AndGate24_out0);

AndGate25 : AND_3
 port map (
  in0 =>  sig_in_X4_inverted,
  in1 =>  sig_in_X2,
  in2 =>  sig_in_X1_inverted,
  out0 => AndGate25_out0);

OrGate0 : OR_4
 port map (
  in0 => AndGate0_out0,
  in1 => AndGate1_out0,
  in2 => AndGate2_out0,
  in3 => AndGate3_out0,
  out0 => OrGate0_out0);

OrGate1 : OR_4
 port map (
  in0 => AndGate4_out0,
  in1 => AndGate5_out0,
  in2 => AndGate6_out0,
  in3 => AndGate7_out0,
  out0 => OrGate1_out0);

OrGate2 : OR_3
 port map (
  in0 => AndGate8_out0,
  in1 => AndGate9_out0,
  in2 => AndGate10_out0,
  out0 => OrGate2_out0);

OrGate3 : OR_5
 port map (
  in0 => AndGate11_out0,
  in1 => AndGate12_out0,
  in2 => AndGate13_out0,
  in3 => AndGate14_out0,
  in4 => AndGate15_out0,
  out0 => OrGate3_out0);

OrGate4 : OR_2
 port map (
  in0 => AndGate16_out0,
  in1 => AndGate17_out0,
  out0 => OrGate4_out0);

OrGate5 : OR_4
 port map (
  in0 => AndGate18_out0,
  in1 => AndGate19_out0,
  in2 => AndGate20_out0,
  in3 => AndGate21_out0,
  out0 => OrGate5_out0);

OrGate6 : OR_4
 port map (
  in0 => AndGate22_out0,
  in1 => AndGate23_out0,
  in2 => AndGate24_out0,
  in3 => AndGate25_out0,
  out0 => OrGate6_out0);

--Signal mapping
sig_out_a <= OrGate0_out0;
sig_out_b <= OrGate1_out0;
sig_out_c <= OrGate2_out0;
sig_out_d <= OrGate3_out0;
sig_out_e <= OrGate4_out0;
sig_out_f <= OrGate5_out0;
sig_out_g <= OrGate6_out0;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X1_inverted <=  not  sig_in_X1;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X3_inverted <=  not  sig_in_X3;
 sig_in_X2_inverted <=  not  sig_in_X2;
 sig_in_X4_inverted <=  not  sig_in_X4;
 sig_in_X1_inverted <=  not  sig_in_X1;
end structure;
