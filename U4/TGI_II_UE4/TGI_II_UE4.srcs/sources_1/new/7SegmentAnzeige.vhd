----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2015 10:06:25
-- Design Name: 
-- Module Name: 7SegmentAnzeige - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegmentDisplay is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Q : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC_VECTOR (3 downto 0);
           AN0 : out STD_LOGIC;
           AN1 : out STD_LOGIC;
           AN2 : out STD_LOGIC;
           AN3 : out STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           clk : in	STD_LOGIC);
end sevenSegmentDisplay;

architecture Behavioral of sevenSegmentDisplay is

signal A0, A1, A2, A3 : STD_LOGIC;
signal counter : integer range 0 to 10000;
signal SevenSegment : STD_LOGIC_VECTOR (6 downto 0);
shared variable input : bit_vector (3 downto 0);

begin

shifter: process(clk)
begin
   if (clk'event and clk = '1') then
      if ( A0 = A1 and  A2 = A3  and A1 = A2) then
         A0 <= '0';
         A1 <= '1';
         A2 <= '1';
         A3 <= '1'; 
      else
         if counter = 0 then
            A0 <= A3;
            A1 <= A0;
            A2 <= A1;
            A3 <= A2;
            AN0 <= A0;
            AN1 <= A1;
            AN2 <= A2;
            AN3 <= A3;
            if A0 = '0' then input:= to_bitvector(M); end if;
            if A1 = '0' then input:= to_bitvector(Q); end if;
            if A2 = '0' then input:= to_bitvector(A); end if;
            if A3 = '0' then input:= to_bitvector(S); end if;
         end if;
      end if;
   end if;
end process;


-- 12 kHz Generierung
count:      process (clk)
begin
   if clk'event and clk = '1' then
      if counter  = 8332 then
         counter <= 0;
      else
         counter <= counter +1;
      end if;
   end if;
end process;


with input select
SevenSegment <= "0000001" when "0000",
"1001111" when "0001",
"0010010" when "0010",
"0000110" when "0011",
"1001100" when "0100",
"0100100" when "0101",
"0100000" when "0110",
"0001111" when "0111",
"0000000" when "1000",
"0000100" when "1001",
"0001000" when "1010",
"1100000" when "1011",
"0110001" when "1100",
"1000010" when "1101",
"0110000" when "1110",
"0111000" when "1111";

CA <= SevenSegment(6);
CB <= SevenSegment(5);
CC <= SevenSegment(4);
CD <= SevenSegment(3);
CE <= SevenSegment(2);
CF <= SevenSegment(1);
CG <= SevenSegment(0);

end Behavioral;
