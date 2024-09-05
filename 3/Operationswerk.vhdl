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

entity full_adder is
port
(
a,b,c_in : in STD_LOGIC;
cout,s : out STD_LOGIC
);
end full_adder;

architecture dataflow of full_adder is 
begin
cout <= (a and b) or (a and c_in) or (b and c_in) ;
s    <= (a and not b and not c_in) or (b and not a and not c_in) or (c_in and not a and not b) or (a and b and c_in) ;
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

entity Mux4_1 is
port
(
in0,in1,in2,in3 : in STD_LOGIC;
s0 ,s1 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end Mux4_1;

architecture behavior of Mux4_1 is 
use IEEE.NUMERIC_STD.ALL;
signal inport : STD_LOGIC_VECTOR(3 downto 0);
signal selector : STD_LOGIC_VECTOR(1 downto 0);
begin
inport(0) <= in0;
inport(1) <= in1;
inport(2) <= in2;
inport(3) <= in3;
selector(0) <= s0;
selector(1) <= s1;
MUX_process : process (selector, inport) 
variable selector_int : integer;
begin
    selector_int := to_integer(unsigned(selector));
    if selector_int < 4 then 
        out0 <= inport(selector_int);
-- pragma  synthesis_off 
    else
        out0 <= 'U';
-- pragma  synthesis_on 
    end if;
end process;
end behavior;

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

entity Mux2_1 is
port
(
in0,in1 : in STD_LOGIC;
s0 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end Mux2_1;

architecture behavior of Mux2_1 is 
use IEEE.NUMERIC_STD.ALL;
signal inport : STD_LOGIC_VECTOR(1 downto 0);
signal selector : STD_LOGIC_VECTOR(0 downto 0);
begin
inport(0) <= in0;
inport(1) <= in1;
selector(0) <= s0;
MUX_process : process (selector, inport) 
variable selector_int : integer;
begin
    selector_int := to_integer(unsigned(selector));
    if selector_int < 2 then 
        out0 <= inport(selector_int);
-- pragma  synthesis_off 
    else
        out0 <= 'U';
-- pragma  synthesis_on 
    end if;
end process;
end behavior;

-- Circuit entity

Library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_Operationswerk is
  port
  (
   sig_in_bus0,  sig_in_bus1,  sig_in_bus2,  sig_in_bus3,  sig_in_c0sub,  sig_in_c3S0M,  sig_in_c2loadS,  sig_in_c4selQInbus,  sig_in_c5S0A,  sig_in_c6S1A,  sig_in_c7selAInbus,  sig_in_c12S1Q,  sig_in_c9selS,  sig_in_c10selAQ,  sig_in_c11S0Q,  sig_in_Takt,  sig_in_Start : in STD_LOGIC;
  sig_out_O2 : out STD_LOGIC;
  sig_out_O3 : out STD_LOGIC;
  sig_out_O1 : out STD_LOGIC;
  sig_out_O0 : out STD_LOGIC;
  sig_out_M0 : out STD_LOGIC;
  sig_out_M1 : out STD_LOGIC;
  sig_out_M3 : out STD_LOGIC;
  sig_out_M2 : out STD_LOGIC;
  sig_out_Q0 : out STD_LOGIC;
  sig_out_Q1 : out STD_LOGIC;
  sig_out_Q2 : out STD_LOGIC;
  sig_out_Q3 : out STD_LOGIC;
  sig_out_A0 : out STD_LOGIC;
  sig_out_A1 : out STD_LOGIC;
  sig_out_A2 : out STD_LOGIC;
  sig_out_A3 : out STD_LOGIC;
  sig_out_S : out STD_LOGIC
  );
end circuit_Operationswerk;

-- Structural description of the circuit

architecture structure of circuit_Operationswerk is

component AND_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component full_adder
port
(
a,b,c_in : in STD_LOGIC;
cout,s : out STD_LOGIC
);
end component;

component Exor_2
  port
  (
   in0, in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

component Mux4_1
port
(
in0,in1,in2,in3 : in STD_LOGIC;
s0 ,s1 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end component;

component D_CL_ET_FF
port
(
D,Clock : in STD_LOGIC;
Q : out STD_LOGIC := '0';
Q_inv : out STD_LOGIC := '1'
);
end component;

component Mux2_1
port
(
in0,in1 : in STD_LOGIC;
s0 : in STD_LOGIC;
out0 : out STD_LOGIC
);
end component;

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal AndGate0_out0 , AndGate0_out0_inverted , AndGate1_out0 , AndGate1_out0_inverted , XorGate0_out0 , XorGate0_out0_inverted , XorGate1_out0 , XorGate1_out0_inverted , XorGate2_out0 , XorGate2_out0_inverted , XorGate3_out0 , XorGate3_out0_inverted , FullAdderGate0_out0 , FullAdderGate0_out0_inverted , FullAdderGate0_out1 , FullAdderGate0_out1_inverted , FullAdderGate1_out0 , FullAdderGate1_out0_inverted , FullAdderGate1_out1 , FullAdderGate1_out1_inverted , FullAdderGate2_out0 , FullAdderGate2_out0_inverted , FullAdderGate2_out1 , FullAdderGate2_out1_inverted , FullAdderGate3_out0 , FullAdderGate3_out0_inverted , FullAdderGate3_out1 , FullAdderGate3_out1_inverted , FullAdderGate4_out0 , FullAdderGate4_out0_inverted , FullAdderGate4_out1 , FullAdderGate4_out1_inverted , MultiplexerGate0_out0 , MultiplexerGate0_out0_inverted , MultiplexerGate1_out0 , MultiplexerGate1_out0_inverted , MultiplexerGate2_out0 , MultiplexerGate2_out0_inverted , MultiplexerGate3_out0 , MultiplexerGate3_out0_inverted , MultiplexerGate4_out0 , MultiplexerGate4_out0_inverted , MultiplexerGate5_out0 , MultiplexerGate5_out0_inverted , MultiplexerGate6_out0 , MultiplexerGate6_out0_inverted , MultiplexerGate7_out0 , MultiplexerGate7_out0_inverted , MultiplexerGate8_out0 , MultiplexerGate8_out0_inverted , MultiplexerGate9_out0 , MultiplexerGate9_out0_inverted , MultiplexerGate10_out0 , MultiplexerGate10_out0_inverted , MultiplexerGate11_out0 , MultiplexerGate11_out0_inverted , MultiplexerGate12_out0 , MultiplexerGate12_out0_inverted , MultiplexerGate13_out0 , MultiplexerGate13_out0_inverted , MultiplexerGate14_out0 , MultiplexerGate14_out0_inverted , MultiplexerGate15_out0 , MultiplexerGate15_out0_inverted , MultiplexerGate16_out0 , MultiplexerGate16_out0_inverted , MultiplexerGate17_out0 , MultiplexerGate17_out0_inverted , MultiplexerGate18_out0 , MultiplexerGate18_out0_inverted , MultiplexerGate19_out0 , MultiplexerGate19_out0_inverted , MultiplexerGate20_out0 , MultiplexerGate20_out0_inverted , MultiplexerGate21_out0 , MultiplexerGate21_out0_inverted , MultiplexerGate22_out0 , MultiplexerGate22_out0_inverted , MultiplexerGate23_out0 , MultiplexerGate23_out0_inverted , MultiplexerGate24_out0 , MultiplexerGate24_out0_inverted , DFlipFlop0_out0 , DFlipFlop0_out0_inverted , DFlipFlop0_out1 , DFlipFlop0_out1_inverted , DFlipFlop1_out0 , DFlipFlop1_out0_inverted , DFlipFlop1_out1 , DFlipFlop1_out1_inverted , DFlipFlop2_out0 , DFlipFlop2_out0_inverted , DFlipFlop2_out1 , DFlipFlop2_out1_inverted , DFlipFlop3_out0 , DFlipFlop3_out0_inverted , DFlipFlop3_out1 , DFlipFlop3_out1_inverted , DFlipFlop4_out0 , DFlipFlop4_out0_inverted , DFlipFlop4_out1 , DFlipFlop4_out1_inverted , DFlipFlop5_out0 , DFlipFlop5_out0_inverted , DFlipFlop5_out1 , DFlipFlop5_out1_inverted , DFlipFlop6_out0 , DFlipFlop6_out0_inverted , DFlipFlop6_out1 , DFlipFlop6_out1_inverted , DFlipFlop7_out0 , DFlipFlop7_out0_inverted , DFlipFlop7_out1 , DFlipFlop7_out1_inverted , DFlipFlop8_out0 , DFlipFlop8_out0_inverted , DFlipFlop8_out1 , DFlipFlop8_out1_inverted , DFlipFlop9_out0 , DFlipFlop9_out0_inverted , DFlipFlop9_out1 , DFlipFlop9_out1_inverted , DFlipFlop10_out0 , DFlipFlop10_out0_inverted , DFlipFlop10_out1 , DFlipFlop10_out1_inverted , DFlipFlop11_out0 , DFlipFlop11_out0_inverted , DFlipFlop11_out1 , DFlipFlop11_out1_inverted , DFlipFlop12_out0 , DFlipFlop12_out0_inverted , DFlipFlop12_out1 , DFlipFlop12_out1_inverted : STD_LOGIC;
signal sig_in_bus0_inverted, sig_in_bus1_inverted, sig_in_bus2_inverted, sig_in_bus3_inverted, sig_in_c0sub_inverted, sig_in_c3S0M_inverted, sig_in_c2loadS_inverted, sig_in_c4selQInbus_inverted, sig_in_c5S0A_inverted, sig_in_c6S1A_inverted, sig_in_c7selAInbus_inverted, sig_in_c12S1Q_inverted, sig_in_c9selS_inverted, sig_in_c10selAQ_inverted, sig_in_c11S0Q_inverted, sig_in_Takt_inverted, sig_in_Start_inverted : STD_LOGIC;

begin
AndGate0 : AND_2
 port map (
  in0 =>  sig_in_Takt,
  in1 =>  sig_in_Start,
  out0 => AndGate0_out0);

AndGate1 : AND_2
 port map (
  in0 => AndGate0_out0,
  in1 =>  sig_in_c2loadS,
  out0 => AndGate1_out0);

XorGate0 : Exor_2
 port map (
  in0 => DFlipFlop3_out0,
  in1 =>  sig_in_c0sub,
  out0 => XorGate0_out0);

XorGate1 : Exor_2
 port map (
  in0 => DFlipFlop2_out0,
  in1 =>  sig_in_c0sub,
  out0 => XorGate1_out0);

XorGate2 : Exor_2
 port map (
  in0 => DFlipFlop1_out0,
  in1 =>  sig_in_c0sub,
  out0 => XorGate2_out0);

XorGate3 : Exor_2
 port map (
  in0 => DFlipFlop0_out0,
  in1 =>  sig_in_c0sub,
  out0 => XorGate3_out0);

FullAdderGate0 : full_adder
 port map (
  a => DFlipFlop11_out0,
  b => XorGate0_out0,
  c_in =>  sig_in_c0sub,
  S => FullAdderGate0_out0,
  cout => FullAdderGate0_out1);

FullAdderGate1 : full_adder
 port map (
  a => DFlipFlop10_out0,
  b => XorGate1_out0,
  c_in => FullAdderGate0_out1,
  S => FullAdderGate1_out0,
  cout => FullAdderGate1_out1);

FullAdderGate2 : full_adder
 port map (
  a => DFlipFlop9_out0,
  b => XorGate2_out0,
  c_in => FullAdderGate1_out1,
  S => FullAdderGate2_out0,
  cout => FullAdderGate2_out1);

FullAdderGate3 : full_adder
 port map (
  a => DFlipFlop8_out0,
  b => XorGate3_out0,
  c_in => FullAdderGate2_out1,
  S => FullAdderGate3_out0,
  cout => FullAdderGate3_out1);

FullAdderGate4 : full_adder
 port map (
  a =>  sig_in_c0sub,
  b => DFlipFlop12_out0,
  c_in => FullAdderGate3_out1,
  S => FullAdderGate4_out0,
  cout => FullAdderGate4_out1);

MultiplexerGate0 : Mux4_1
 port map (
  in0 => DFlipFlop0_out0,
  in1 =>  sig_in_bus3,
  in2 => ConstLow,
  in3 => DFlipFlop1_out0,
  s1 => ConstLow,
  s0 =>  sig_in_c3S0M,
  out0 => MultiplexerGate0_out0);

MultiplexerGate1 : Mux4_1
 port map (
  in0 => DFlipFlop1_out0,
  in1 =>  sig_in_bus2,
  in2 => ConstLow,
  in3 => DFlipFlop2_out0,
  s1 => ConstLow,
  s0 =>  sig_in_c3S0M,
  out0 => MultiplexerGate1_out0);

MultiplexerGate2 : Mux4_1
 port map (
  in0 => DFlipFlop2_out0,
  in1 =>  sig_in_bus1,
  in2 => ConstLow,
  in3 => DFlipFlop3_out0,
  s1 => ConstLow,
  s0 =>  sig_in_c3S0M,
  out0 => MultiplexerGate2_out0);

MultiplexerGate3 : Mux4_1
 port map (
  in0 => DFlipFlop3_out0,
  in1 =>  sig_in_bus0,
  in2 => ConstLow,
  in3 => ConstLow,
  s1 => ConstLow,
  s0 =>  sig_in_c3S0M,
  out0 => MultiplexerGate3_out0);

MultiplexerGate4 : Mux4_1
 port map (
  in0 => DFlipFlop4_out0,
  in1 => MultiplexerGate21_out0,
  in2 => ConstLow,
  in3 => DFlipFlop5_out0,
  s1 =>  sig_in_c12S1Q,
  s0 =>  sig_in_c11S0Q,
  out0 => MultiplexerGate4_out0);

MultiplexerGate5 : Mux4_1
 port map (
  in0 => DFlipFlop5_out0,
  in1 => MultiplexerGate22_out0,
  in2 => ConstLow,
  in3 => DFlipFlop6_out0,
  s1 =>  sig_in_c12S1Q,
  s0 =>  sig_in_c11S0Q,
  out0 => MultiplexerGate5_out0);

MultiplexerGate6 : Mux4_1
 port map (
  in0 => DFlipFlop6_out0,
  in1 => MultiplexerGate23_out0,
  in2 => ConstLow,
  in3 => DFlipFlop7_out0,
  s1 =>  sig_in_c12S1Q,
  s0 =>  sig_in_c11S0Q,
  out0 => MultiplexerGate6_out0);

MultiplexerGate7 : Mux4_1
 port map (
  in0 => DFlipFlop7_out0,
  in1 => MultiplexerGate24_out0,
  in2 => ConstLow,
  in3 => ConstLow,
  s1 =>  sig_in_c12S1Q,
  s0 =>  sig_in_c11S0Q,
  out0 => MultiplexerGate7_out0);

MultiplexerGate8 : Mux4_1
 port map (
  in0 => DFlipFlop8_out0,
  in1 => MultiplexerGate17_out0,
  in2 => ConstLow,
  in3 => DFlipFlop9_out0,
  s1 =>  sig_in_c6S1A,
  s0 =>  sig_in_c5S0A,
  out0 => MultiplexerGate8_out0);

MultiplexerGate9 : Mux4_1
 port map (
  in0 => DFlipFlop9_out0,
  in1 => MultiplexerGate18_out0,
  in2 => ConstLow,
  in3 => DFlipFlop10_out0,
  s1 =>  sig_in_c6S1A,
  s0 =>  sig_in_c5S0A,
  out0 => MultiplexerGate9_out0);

MultiplexerGate10 : Mux4_1
 port map (
  in0 => DFlipFlop10_out0,
  in1 => MultiplexerGate19_out0,
  in2 => ConstLow,
  in3 => DFlipFlop11_out0,
  s1 =>  sig_in_c6S1A,
  s0 =>  sig_in_c5S0A,
  out0 => MultiplexerGate10_out0);

MultiplexerGate11 : Mux4_1
 port map (
  in0 => DFlipFlop11_out0,
  in1 => MultiplexerGate20_out0,
  in2 => ConstLow,
  in3 => DFlipFlop4_out0,
  s1 =>  sig_in_c6S1A,
  s0 =>  sig_in_c5S0A,
  out0 => MultiplexerGate11_out0);

MultiplexerGate12 : Mux2_1
 port map (
  in0 => DFlipFlop8_out0,
  in1 => DFlipFlop4_out0,
  s0 =>  sig_in_c10selAQ,
  out0 => MultiplexerGate12_out0);

MultiplexerGate13 : Mux2_1
 port map (
  in0 => DFlipFlop9_out0,
  in1 => DFlipFlop5_out0,
  s0 =>  sig_in_c10selAQ,
  out0 => MultiplexerGate13_out0);

MultiplexerGate14 : Mux2_1
 port map (
  in0 => DFlipFlop10_out0,
  in1 => DFlipFlop6_out0,
  s0 =>  sig_in_c10selAQ,
  out0 => MultiplexerGate14_out0);

MultiplexerGate15 : Mux2_1
 port map (
  in0 => DFlipFlop11_out0,
  in1 => DFlipFlop7_out0,
  s0 =>  sig_in_c10selAQ,
  out0 => MultiplexerGate15_out0);

MultiplexerGate16 : Mux2_1
 port map (
  in0 => DFlipFlop8_out0,
  in1 => FullAdderGate4_out0,
  s0 =>  sig_in_c9selS,
  out0 => MultiplexerGate16_out0);

MultiplexerGate17 : Mux2_1
 port map (
  in0 => FullAdderGate3_out0,
  in1 =>  sig_in_bus3,
  s0 =>  sig_in_c7selAInbus,
  out0 => MultiplexerGate17_out0);

MultiplexerGate18 : Mux2_1
 port map (
  in0 => FullAdderGate2_out0,
  in1 =>  sig_in_bus2,
  s0 =>  sig_in_c7selAInbus,
  out0 => MultiplexerGate18_out0);

MultiplexerGate19 : Mux2_1
 port map (
  in0 => FullAdderGate1_out0,
  in1 =>  sig_in_bus1,
  s0 =>  sig_in_c7selAInbus,
  out0 => MultiplexerGate19_out0);

MultiplexerGate20 : Mux2_1
 port map (
  in0 => FullAdderGate0_out0,
  in1 =>  sig_in_bus0,
  s0 =>  sig_in_c7selAInbus,
  out0 => MultiplexerGate20_out0);

MultiplexerGate21 : Mux2_1
 port map (
  in0 => DFlipFlop4_out0,
  in1 =>  sig_in_bus3,
  s0 =>  sig_in_c4selQInbus,
  out0 => MultiplexerGate21_out0);

MultiplexerGate22 : Mux2_1
 port map (
  in0 => DFlipFlop5_out0,
  in1 =>  sig_in_bus2,
  s0 =>  sig_in_c4selQInbus,
  out0 => MultiplexerGate22_out0);

MultiplexerGate23 : Mux2_1
 port map (
  in0 => DFlipFlop6_out0,
  in1 =>  sig_in_bus1,
  s0 =>  sig_in_c4selQInbus,
  out0 => MultiplexerGate23_out0);

MultiplexerGate24 : Mux2_1
 port map (
  in0 => ConstHigh,
  in1 =>  sig_in_bus0,
  s0 =>  sig_in_c4selQInbus,
  out0 => MultiplexerGate24_out0);

DFlipFlop0 : D_CL_ET_FF
 port map (
  D => MultiplexerGate0_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop0_out0,
  Q_inv => DFlipFlop0_out1);

DFlipFlop1 : D_CL_ET_FF
 port map (
  D => MultiplexerGate1_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop1_out0,
  Q_inv => DFlipFlop1_out1);

DFlipFlop2 : D_CL_ET_FF
 port map (
  D => MultiplexerGate2_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop2_out0,
  Q_inv => DFlipFlop2_out1);

DFlipFlop3 : D_CL_ET_FF
 port map (
  D => MultiplexerGate3_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop3_out0,
  Q_inv => DFlipFlop3_out1);

DFlipFlop4 : D_CL_ET_FF
 port map (
  D => MultiplexerGate4_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop4_out0,
  Q_inv => DFlipFlop4_out1);

DFlipFlop5 : D_CL_ET_FF
 port map (
  D => MultiplexerGate5_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop5_out0,
  Q_inv => DFlipFlop5_out1);

DFlipFlop6 : D_CL_ET_FF
 port map (
  D => MultiplexerGate6_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop6_out0,
  Q_inv => DFlipFlop6_out1);

DFlipFlop7 : D_CL_ET_FF
 port map (
  D => MultiplexerGate7_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop7_out0,
  Q_inv => DFlipFlop7_out1);

DFlipFlop8 : D_CL_ET_FF
 port map (
  D => MultiplexerGate8_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop8_out0,
  Q_inv => DFlipFlop8_out1);

DFlipFlop9 : D_CL_ET_FF
 port map (
  D => MultiplexerGate9_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop9_out0,
  Q_inv => DFlipFlop9_out1);

DFlipFlop10 : D_CL_ET_FF
 port map (
  D => MultiplexerGate10_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop10_out0,
  Q_inv => DFlipFlop10_out1);

DFlipFlop11 : D_CL_ET_FF
 port map (
  D => MultiplexerGate11_out0,
  Clock => AndGate0_out0,
  Q => DFlipFlop11_out0,
  Q_inv => DFlipFlop11_out1);

DFlipFlop12 : D_CL_ET_FF
 port map (
  D => MultiplexerGate16_out0,
  Clock => AndGate1_out0,
  Q => DFlipFlop12_out0,
  Q_inv => DFlipFlop12_out1);

--Signal mapping
sig_out_O2 <= MultiplexerGate13_out0;
sig_out_O3 <= MultiplexerGate12_out0;
sig_out_O1 <= MultiplexerGate14_out0;
sig_out_O0 <= MultiplexerGate15_out0;
sig_out_M0 <= DFlipFlop3_out0;
sig_out_M1 <= DFlipFlop2_out0;
sig_out_M3 <= DFlipFlop0_out0;
sig_out_M2 <= DFlipFlop1_out0;
sig_out_Q0 <= DFlipFlop7_out0;
sig_out_Q1 <= DFlipFlop6_out0;
sig_out_Q2 <= DFlipFlop5_out0;
sig_out_Q3 <= DFlipFlop4_out0;
sig_out_A0 <= DFlipFlop11_out0;
sig_out_A1 <= DFlipFlop10_out0;
sig_out_A2 <= DFlipFlop9_out0;
sig_out_A3 <= DFlipFlop8_out0;
sig_out_S <= DFlipFlop12_out0;
end structure;
