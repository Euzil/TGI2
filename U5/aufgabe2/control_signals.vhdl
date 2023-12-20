library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;

package control_signals is
  -- ALU Operations
  constant CTRL_ALU_OP_NOP   : std_logic_vector(7 downto 0) := "00000000";
  constant CTRL_ALU_OP_OP1   : std_logic_vector(7 downto 0) := "00010000";
  constant CTRL_ALU_OP_OP2   : std_logic_vector(7 downto 0) := "00010001";
  constant CTRL_ALU_OP_ADD   : std_logic_vector(7 downto 0) := "00000001";
  constant CTRL_ALU_OP_SUB   : std_logic_vector(7 downto 0) := "00000010";
  constant CTRL_ALU_OP_OR    : std_logic_vector(7 downto 0) := "00000011";
  constant CTRL_ALU_OP_AND   : std_logic_vector(7 downto 0) := "00000100";
  constant CTRL_ALU_OP_XOR   : std_logic_vector(7 downto 0) := "00000101";
  constant CTRL_ALU_OP_SLL   : std_logic_vector(7 downto 0) := "00000110";
  constant CTRL_ALU_OP_SRL   : std_logic_vector(7 downto 0) := "00000111";
  constant CTRL_ALU_OP_SRA   : std_logic_vector(7 downto 0) := "00001000";
  constant CTRL_ALU_OP_EQ    : std_logic_vector(7 downto 0) := "00001001";
  constant CTRL_ALU_OP_NEQ   : std_logic_vector(7 downto 0) := "00001010";
  constant CTRL_ALU_OP_LT    : std_logic_vector(7 downto 0) := "00001011";
  constant CTRL_ALU_OP_GE    : std_logic_vector(7 downto 0) := "00001100";
  constant CTRL_ALU_OP_LTU   : std_logic_vector(7 downto 0) := "00001101";
  constant CTRL_ALU_OP_GEU   : std_logic_vector(7 downto 0) := "00001110";
  constant CTRL_ALU_OP_MERGE : std_logic_vector(7 downto 0) := "10000000";
  constant CTRL_ALU_OP_MUL   : std_logic_vector(7 downto 0) := "10000001";
  constant CTRL_ALU_OP_MULH  : std_logic_vector(7 downto 0) := "10000010";
  constant CTRL_ALU_OP_MULHU : std_logic_vector(7 downto 0) := "10000011";
  
  -- ALU Source Input
  constant CTRL_ALU_SRC_REG : std_logic_vector(1 downto 0) := "00";
  constant CTRL_ALU_SRC_IMM : std_logic_vector(1 downto 0) := "01";
  constant CTRL_ALU_SRC_PC  : std_logic_vector(1 downto 0) := "10";
  constant CTRL_ALU_SRC_4   : std_logic_vector(1 downto 0) := "11";
  
  -- Rd Source
  constant CTRL_RD_SRC_ALU_RESULT : std_logic := '0';
  constant CTRL_RD_SRC_MEM_DATA   : std_logic := '1';

  -- Next Program Counter
  constant CTRL_PC_SRC_PC_NEXT : std_logic_vector(1 downto 0) := "00";
  constant CTRL_PC_SRC_PC_IMM  : std_logic_vector(1 downto 0) := "01";
  constant CTRL_PC_SRC_RS1_IMM : std_logic_vector(1 downto 0) := "10";

  -- Memory Interface Commands
  constant CTRL_MEM_CMD_WRITE_B : std_logic_vector(4 downto 0) := "00000";
  constant CTRL_MEM_CMD_WRITE_H : std_logic_vector(4 downto 0) := "00001";
  constant CTRL_MEM_CMD_WRITE_W : std_logic_vector(4 downto 0) := "00010";
  constant CTRL_MEM_CMD_READ_B  : std_logic_vector(4 downto 0) := "01000";
  constant CTRL_MEM_CMD_READ_H  : std_logic_vector(4 downto 0) := "01001";
  constant CTRL_MEM_CMD_READ_W  : std_logic_vector(4 downto 0) := "01010";
  constant CTRL_MEM_CMD_READ_BU : std_logic_vector(4 downto 0) := "01100";
  constant CTRL_MEM_CMD_READ_HU : std_logic_vector(4 downto 0) := "01101";
  constant CTRL_MEM_CMD_NOP     : std_logic_vector(4 downto 0) := "10000";

end package control_signals;

package body control_signals is
end package body control_signals;
