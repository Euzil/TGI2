----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2019 14:21:41
-- Design Name: 
-- Module Name: Operationswerk - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Operationswerk is
  Generic (
      DATA_WIDTH : natural := 4
    );
    Port ( 
      clock  : IN  STD_LOGIC;
      INBUS  : IN  STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
      OUTBUS : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
      c0     : IN  STD_LOGIC;
      -- c1     : IN  STD_LOGIC; -- wird nicht im OW benoetigt, nur im Zaehler
      c2     : IN  STD_LOGIC;
      c3     : IN  STD_LOGIC;
      c4     : IN  STD_LOGIC;
      c5     : IN  STD_LOGIC;
      c6     : IN  STD_LOGIC;
      c7     : IN  STD_LOGIC;
      -- c8     : IN  STD_LOGIC; -- wird nicht im OW benoetigt, nur im Zaehler
      c9     : IN  STD_LOGIC;
      c10    : IN  STD_LOGIC;
      c11    : IN  STD_LOGIC;
      c12    : IN  STD_LOGIC;
      k2     : OUT STD_LOGIC;
      
      A_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
      Q_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
      M_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
      S_out : OUT STD_LOGIC
    );
end Operationswerk;

architecture Behavioral of Operationswerk is
    signal A : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal Q : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal M : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal S : STD_LOGIC := '0';
    signal ALU_OUT  : STD_LOGIC_VECTOR(DATA_WIDTH downto 0) := (others => '0');
    signal MUX1_OUT : STD_LOGIC := '0';
    signal MUXQ_OUT : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal MUXA_OUT : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
    
begin
    with c0 select
        ALU_OUT <= std_logic_vector( unsigned( S & A) - unsigned( '0' & M)) when '1',
                   std_logic_vector( unsigned( S & A) + unsigned( '0' & M)) when others;

    with c4 select
        MUXQ_OUT <= INBUS                                                   when '1',
                    Q(DATA_WIDTH - 1 downto 1) & '1'                        when others;
                   
    with c7 select
        MUXA_OUT <= INBUS                                                   when '1',
                    ALU_OUT(DATA_WIDTH - 1 downto 0)                        when others;

    with c9 select
        MUX1_OUT <= ALU_OUT(DATA_WIDTH)                                     when '1',
                    A(DATA_WIDTH - 1)                                       when others;
                    
process (clock)
begin
    if rising_edge(clock) then
        
        if (c2 = '1') then
            S <= MUX1_OUT;
        end if;
        
        if (c3 = '1') then
            M <= INBUS;
        end if;
        
        if    (c5 = '1') and (c6 = '1') then
            A <= A(DATA_WIDTH - 2 downto 0) & Q(DATA_WIDTH - 1);
        elsif (c5 = '0') and (c6 = '1') then
            A <= (others => '0');
        elsif (c5 = '1') and (c6 = '0') then
            A <= MUXA_OUT;
        end if;
        
        if    (c11 = '1') and (c12 = '1') then
            Q <= Q(DATA_WIDTH - 2 downto 0) & '0';
        elsif (c11 = '0') and (c12 = '1') then
            Q <= (others => '0');
        elsif (c11 = '1') and (c12 = '0') then
            Q <= MUXQ_OUT;
        end if;
        
        if (c10 = '1') then
            OUTBUS <= A;
        else
            OUTBUS <= Q;
        end if;
        
    end if;
end process;

A_out <= A;
Q_out <= Q;
M_out <= M;
S_out <= S;

k2 <= S;

end Behavioral;
