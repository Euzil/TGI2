library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.control_signals.all;

entity m_contol_gen is
  port (
    instruction   : in  std_logic_vector(31 downto 0);

    ctrl_alu_src1 : out std_logic_vector(1 downto 0);
    ctrl_alu_src2 : out std_logic_vector(1 downto 0);
    ctrl_alu_op   : out std_logic_vector(7 downto 0);
    ctrl_mem_cmd  : out std_logic_vector(4 downto 0);
    ctrl_rd_src   : out std_logic;
    ctrl_rd_we    : out std_logic;
    ctrl_pc_src   : out std_logic_vector(1 downto 0);
    ctrl_branch   : out std_logic
  );
end entity m_contol_gen;

architecture rtl of m_contol_gen is
	alias funct3 : std_logic_vector(2 downto 0) is instruction(14 downto 12);
	alias funct7 : std_logic_vector(6 downto 0) is instruction(31 downto 25);
	alias opcode : std_logic_vector(6 downto 0) is instruction( 6 downto  0);
begin

  singals:process(instruction)
  begin   
    ctrl_mem_cmd   <= CTRL_MEM_CMD_NOP;
    ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
    ctrl_alu_src2  <= CTRL_ALU_SRC_REG;
    ctrl_alu_op    <= CTRL_ALU_OP_NOP;
    ctrl_rd_src    <= CTRL_RD_SRC_ALU_RESULT;
    ctrl_rd_we     <= '0';
    ctrl_pc_src    <= CTRL_PC_SRC_PC_NEXT;
    ctrl_branch    <= '0';

    -- LUI
    if opcode = "0110111" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_IMM;
      ctrl_alu_op    <= CTRL_ALU_OP_OP1;
      ctrl_rd_we     <= '1';

    -- AUIPC
    elsif opcode = "0010111" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_PC;
      ctrl_alu_src2  <= CTRL_ALU_SRC_IMM;
      ctrl_alu_op    <= CTRL_ALU_OP_ADD;
      ctrl_rd_we     <= '1';

    -- JAL
    elsif opcode = "1101111" then
      ctrl_pc_src    <= CTRL_PC_SRC_PC_IMM;

      ctrl_alu_src1  <= CTRL_ALU_SRC_PC;
      ctrl_alu_src2  <= CTRL_ALU_SRC_4;
      ctrl_alu_op    <= CTRL_ALU_OP_ADD;
      ctrl_rd_we     <= '1';

    -- JALR
    elsif opcode = "1100111" then
      ctrl_pc_src    <= CTRL_PC_SRC_RS1_IMM;

      ctrl_alu_src1  <= CTRL_ALU_SRC_PC;
      ctrl_alu_src2  <= CTRL_ALU_SRC_4;
      ctrl_alu_op    <= CTRL_ALU_OP_ADD;
      ctrl_rd_we     <= '1';

    -- Conditional Branch Instructions
    elsif opcode = "1100011" then
      ctrl_branch    <= '1';

      case (funct3) is
        when "000"  => ctrl_alu_op <= CTRL_ALU_OP_EQ ;
        when "001"  => ctrl_alu_op <= CTRL_ALU_OP_NEQ;
        when "100"  => ctrl_alu_op <= CTRL_ALU_OP_LT ;
        when "101"  => ctrl_alu_op <= CTRL_ALU_OP_GE ;
        when "110"  => ctrl_alu_op <= CTRL_ALU_OP_LTU;
        when "111"  => ctrl_alu_op <= CTRL_ALU_OP_GEU;
        when others => ctrl_alu_op <= CTRL_ALU_OP_NOP;
      end case;

    -- Load Instructions
    elsif opcode = "0000011" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
      ctrl_alu_src2  <= CTRL_ALU_SRC_IMM;
      ctrl_alu_op    <= CTRL_ALU_OP_ADD;
      ctrl_rd_src    <= CTRL_RD_SRC_MEM_DATA;
      ctrl_rd_we     <= '1';
      
      case (funct3) is
        when "000"  => ctrl_mem_cmd <= CTRL_MEM_CMD_READ_B ;
        when "001"  => ctrl_mem_cmd <= CTRL_MEM_CMD_READ_H ;
        when "010"  => ctrl_mem_cmd <= CTRL_MEM_CMD_READ_W ;
        when "100"  => ctrl_mem_cmd <= CTRL_MEM_CMD_READ_BU;
        when "101"  => ctrl_mem_cmd <= CTRL_MEM_CMD_READ_HU;
        when others => ctrl_mem_cmd <= CTRL_MEM_CMD_NOP;
      end case;

    -- Store Instructions
    elsif opcode = "0100011" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
      ctrl_alu_src2  <= CTRL_ALU_SRC_IMM;
      ctrl_alu_op    <= CTRL_ALU_OP_ADD;

      case (funct3) is
        when "000"  => ctrl_mem_cmd <= CTRL_MEM_CMD_WRITE_B;
        when "001"  => ctrl_mem_cmd <= CTRL_MEM_CMD_WRITE_H;
        when "010"  => ctrl_mem_cmd <= CTRL_MEM_CMD_WRITE_W;
        when others => ctrl_mem_cmd <= CTRL_MEM_CMD_NOP;
      end case;

    -- Arithmetic Register-Immediate Instructions
    elsif opcode = "0010011" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
      ctrl_alu_src2  <= CTRL_ALU_SRC_IMM;
      ctrl_rd_we     <= '1';

      case (funct3) is 
        when "000"  => ctrl_alu_op <= CTRL_ALU_OP_ADD;
        when "001"  => ctrl_alu_op <= CTRL_ALU_OP_SLL;
        when "010"  => ctrl_alu_op <= CTRL_ALU_OP_LT ;
        when "011"  => ctrl_alu_op <= CTRL_ALU_OP_LTU;
        when "100"  => ctrl_alu_op <= CTRL_ALU_OP_XOR;
        when "101"  => if (funct7 = "0100000") then ctrl_alu_op <= CTRL_ALU_OP_SRA; else ctrl_alu_op <= CTRL_ALU_OP_SRL; end if;
        when "110"  => ctrl_alu_op <= CTRL_ALU_OP_OR ;
        when "111"  => ctrl_alu_op <= CTRL_ALU_OP_AND;
        when others => ctrl_alu_op <= CTRL_ALU_OP_NOP;
      end case;
      

    -- Arithmetic Register-Register Instructions
    elsif opcode = "0110011" then
      ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
      ctrl_alu_src2  <= CTRL_ALU_SRC_REG;
      ctrl_rd_we     <= '1';

      if (funct7 = "0000000") then
        case (funct3) is
          when "000"  => ctrl_alu_op <= CTRL_ALU_OP_ADD;
          when "001"  => ctrl_alu_op <= CTRL_ALU_OP_SLL;
          when "010"  => ctrl_alu_op <= CTRL_ALU_OP_LT ;
          when "011"  => ctrl_alu_op <= CTRL_ALU_OP_LTU;
          when "100"  => ctrl_alu_op <= CTRL_ALU_OP_XOR;
          when "101"  => ctrl_alu_op <= CTRL_ALU_OP_SRL;
          when "110"  => ctrl_alu_op <= CTRL_ALU_OP_OR ;
          when "111"  => ctrl_alu_op <= CTRL_ALU_OP_AND;
          when others => ctrl_alu_op <= CTRL_ALU_OP_NOP;
        end case;
      elsif (funct7 = "0100000") then
        case (funct3) is
          when "000"  => ctrl_alu_op <= CTRL_ALU_OP_SUB;
          when "101"  => ctrl_alu_op <= CTRL_ALU_OP_SRA;
          when others => ctrl_alu_op <= CTRL_ALU_OP_NOP;
        end case;
        
      elsif (funct7 = "0000001") then
        case (funct3) is
          when "000"  => ctrl_alu_op <= CTRL_ALU_OP_MUL;
          when "001"  => ctrl_alu_op <= CTRL_ALU_OP_MULH;
          when "011"  => ctrl_alu_op <= CTRL_ALU_OP_MULHU;
          when others => ctrl_alu_op <= CTRL_ALU_OP_NOP;
        end case;
      else
        ctrl_alu_op <= CTRL_ALU_OP_NOP;
      end if;
      
    -- Merge Instruction
    elsif (opcode = "1111111") and (funct3 = "000") and (funct7 = "0000000") then
      ctrl_alu_src1  <= CTRL_ALU_SRC_REG;
      ctrl_alu_src2  <= CTRL_ALU_SRC_REG;
      ctrl_rd_we     <= '1';
      ctrl_alu_op    <= CTRL_ALU_OP_MERGE;
      
    end if;
  end process;
		
end architecture rtl;
