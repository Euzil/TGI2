--Definition of the required components

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

entity circuit_or is
  port
  (
   sig_in_0,  sig_in_1 : in STD_LOGIC;
  sig_out_0 : out STD_LOGIC
  );
end circuit_or;

-- Structural description of the circuit

architecture structure of circuit_or is

component OR_2
  port
  (
   in0,in1 : in STD_LOGIC;
   out0 : out STD_LOGIC
  );
end component;

constant ConstLow : STD_LOGIC := '0';
constant ConstHigh : STD_LOGIC := '1';
signal OrGate0_out0 , OrGate0_out0_inverted : STD_LOGIC;
signal sig_in_0_inverted, sig_in_1_inverted : STD_LOGIC;

begin
OrGate0 : OR_2
 port map (
  in0 =>  sig_in_0,
  in1 =>  sig_in_1,
  out0 => OrGate0_out0);

--Signal mapping
sig_out_0 <= OrGate0_out0;
end structure;
