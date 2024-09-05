library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity m_imm_decoder is
  port (
    instruction   : in  std_logic_vector(31 downto 0);
    ctrl_imm      : out std_logic_vector(31 downto 0)
  );
end entity m_imm_decoder;

architecture rtl of m_imm_decoder is
	alias opcode : std_logic_vector(6 downto 0) is instruction(6 downto 0);
begin

  process(instruction)
  begin
    case (opcode) is
      -- R
      when "1111111" | "0110011" => 
        ctrl_imm <= (31 downto 0 => '0');
      
      -- I
      when "1100111" | "0000011" | "0010011" => 
        ctrl_imm <= 
          (19 downto 0 => instruction(31)) &
          instruction(31 downto 20);
        
      -- S
      when "0100011" => 
        ctrl_imm <= 
          (19 downto 0 => instruction(31)) &
          instruction(31 downto 25) & 
          instruction(11 downto 7);
      
      -- U
      when "0110111" | "0010111" => 
        ctrl_imm <= 
          instruction(31 downto 12) & 
          "000000000000";
      
      -- J
      when "1101111" => 
        ctrl_imm <= 
          (11 downto 0 => instruction(31)) &
          instruction(19 downto 12) &
          instruction(20) &
          instruction(30 downto 21) &
          '0';
      
      -- B
      when "1100011" => 
        ctrl_imm <= 
          (19 downto 0 => instruction(31)) &
          instruction(7) &
          instruction(30 downto 25) &
          instruction(11 downto 8) &
          '0';
      
      -- else
      when others => 
        ctrl_imm <= (31 downto 0   => '0');
    end case;
  end process;  
		
end architecture rtl;
