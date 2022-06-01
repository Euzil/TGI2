library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.control_signals.all;

entity m_alu is
  port (
    reg_op1   : in  std_logic_vector(31 downto 0);
    reg_op2   : in  std_logic_vector(31 downto 0);
    operation : in  std_logic_vector( 7 downto 0);
    result    : out std_logic_vector(31 downto 0)
  );
end entity m_alu;

architecture rtl of m_alu is
    constant CONST_ZERO : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";   -- (others => '0');
    constant CONST_ONE  : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";   -- (0 => '1', others => '0');

    function f_LOW(value : std_logic_vector(63 downto 0)) 
      return std_logic_vector is
    begin
      return value(31 downto 0);
    end f_LOW;
    
    function f_HIGH(value : std_logic_vector(63 downto 0))
      return std_logic_vector is
    begin
      return value(63 downto 32);
    end f_HIGH;
begin

    process(reg_op1, reg_op2, operation)
    begin   
        case (operation) is
            when CTRL_ALU_OP_NOP   => result <= CONST_ZERO;

            when CTRL_ALU_OP_OP1   => result <= reg_op1;
            when CTRL_ALU_OP_OP2   => result <= reg_op2;

            when CTRL_ALU_OP_ADD   => result <= std_logic_vector(unsigned(reg_op1) + unsigned(reg_op2));
            when CTRL_ALU_OP_SUB   => result <= std_logic_vector(unsigned(reg_op1) - unsigned(reg_op2));

            when CTRL_ALU_OP_MERGE => result <= reg_op1(31 downto 16) & reg_op2(15 downto 0) ;

            when CTRL_ALU_OP_OR    => result <= reg_op1 or  reg_op2;
            when CTRL_ALU_OP_AND   => result <= reg_op1 and reg_op2;
            when CTRL_ALU_OP_XOR   => result <= reg_op1 xor reg_op2;

            when CTRL_ALU_OP_EQ    => if (        (reg_op1) =          (reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;
            when CTRL_ALU_OP_NEQ   => if (        (reg_op1) /=         (reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;
            when CTRL_ALU_OP_LTU   => if (unsigned(reg_op1) <  unsigned(reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;
            when CTRL_ALU_OP_GEU   => if (unsigned(reg_op1) >= unsigned(reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;
            when CTRL_ALU_OP_LT    => if (  signed(reg_op1) <    signed(reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;
            when CTRL_ALU_OP_GE    => if (  signed(reg_op1) >=   signed(reg_op2)) then result <= CONST_ONE; else result <= CONST_ZERO; end if;

            when CTRL_ALU_OP_SLL   => result <= std_logic_vector(shift_left (unsigned(reg_op1), to_integer(unsigned(reg_op2(4 downto 0)))));
            when CTRL_ALU_OP_SRL   => result <= std_logic_vector(shift_right(unsigned(reg_op1), to_integer(unsigned(reg_op2(4 downto 0)))));
            when CTRL_ALU_OP_SRA   => result <= std_logic_vector(shift_right(  signed(reg_op1), to_integer(unsigned(reg_op2(4 downto 0)))));

            when CTRL_ALU_OP_MUL   => result <= f_LOW(std_logic_vector(signed(reg_op1) * signed(reg_op2)));

            when CTRL_ALU_OP_MULH  => result <= f_HIGH(std_logic_vector(signed(reg_op1) * signed(reg_op2)));

            when CTRL_ALU_OP_MULHU => result <= f_HIGH(std_logic_vector(unsigned(reg_op1) * unsigned(reg_op2)));
            
            when others            => result <= CONST_ZERO;
        end case;
    end process;
    
end architecture rtl;
