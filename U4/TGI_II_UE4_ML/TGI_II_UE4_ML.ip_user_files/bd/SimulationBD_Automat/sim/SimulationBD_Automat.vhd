--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.3 (win64) Build 3173277 Wed Apr  7 05:07:49 MDT 2021
--Date        : Fri Jan 21 08:40:16 2022
--Host        : DESKTOP-7REPPQD running 64-bit major release  (build 9200)
--Command     : generate_target SimulationBD_Automat.bd
--Design      : SimulationBD_Automat
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SimulationBD_Automat is
  port (
    A : out STD_LOGIC_VECTOR ( 3 downto 0 );
    COUNTER : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CS : out STD_LOGIC_VECTOR ( 12 downto 0 );
    Done : out STD_LOGIC;
    INBUS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    M : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Sign : out STD_LOGIC;
    clk : in STD_LOGIC;
    k1_start : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SimulationBD_Automat : entity is "SimulationBD_Automat,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SimulationBD_Automat,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SimulationBD_Automat : entity is "SimulationBD_Automat.hwdef";
end SimulationBD_Automat;

architecture STRUCTURE of SimulationBD_Automat is
  component SimulationBD_Automat_Steuerwerk_Moore_0_0 is
  port (
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    c0 : out STD_LOGIC;
    c1 : out STD_LOGIC;
    c2 : out STD_LOGIC;
    c3 : out STD_LOGIC;
    c4 : out STD_LOGIC;
    c5 : out STD_LOGIC;
    c6 : out STD_LOGIC;
    c7 : out STD_LOGIC;
    c8 : out STD_LOGIC;
    c9 : out STD_LOGIC;
    c10 : out STD_LOGIC;
    c11 : out STD_LOGIC;
    c12 : out STD_LOGIC;
    k1 : in STD_LOGIC;
    k2 : in STD_LOGIC;
    k3 : in STD_LOGIC;
    DONE : out STD_LOGIC
  );
  end component SimulationBD_Automat_Steuerwerk_Moore_0_0;
  component SimulationBD_Automat_circuit_Zaehler_3_0_0 is
  port (
    sig_in_incCnt : in STD_LOGIC;
    sig_in_Reset : in STD_LOGIC;
    sig_in_Text : in STD_LOGIC;
    sig_out_Q0 : out STD_LOGIC;
    sig_out_Q1 : out STD_LOGIC;
    sig_out_null : out STD_LOGIC
  );
  end component SimulationBD_Automat_circuit_Zaehler_3_0_0;
  component SimulationBD_Automat_circuit_or_0_0 is
  port (
    sig_in_0 : in STD_LOGIC;
    sig_in_1 : in STD_LOGIC;
    sig_out_0 : out STD_LOGIC
  );
  end component SimulationBD_Automat_circuit_or_0_0;
  component SimulationBD_Automat_Operationswerk_0_0 is
  port (
    clock : in STD_LOGIC;
    INBUS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    OUTBUS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    c0 : in STD_LOGIC;
    c2 : in STD_LOGIC;
    c3 : in STD_LOGIC;
    c4 : in STD_LOGIC;
    c5 : in STD_LOGIC;
    c6 : in STD_LOGIC;
    c7 : in STD_LOGIC;
    c9 : in STD_LOGIC;
    c10 : in STD_LOGIC;
    c11 : in STD_LOGIC;
    c12 : in STD_LOGIC;
    k2 : out STD_LOGIC;
    A_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Q_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_out : out STD_LOGIC
  );
  end component SimulationBD_Automat_Operationswerk_0_0;
  component SimulationBD_Automat_util_vector_logic_0_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component SimulationBD_Automat_util_vector_logic_0_0;
  component SimulationBD_Automat_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  end component SimulationBD_Automat_xlconcat_0_0;
  component SimulationBD_Automat_xlconcat_1_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component SimulationBD_Automat_xlconcat_1_0;
  signal INBUS_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Operationswerk_0_A_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Operationswerk_0_M_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Operationswerk_0_Q_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal Operationswerk_0_S_out : STD_LOGIC;
  signal Operationswerk_0_k2 : STD_LOGIC;
  signal Steuerwerk_Moore_0_DONE : STD_LOGIC;
  signal Steuerwerk_Moore_0_c0 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c1 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c10 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c11 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c12 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c2 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c3 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c4 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c5 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c6 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c7 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c8 : STD_LOGIC;
  signal Steuerwerk_Moore_0_c9 : STD_LOGIC;
  signal circuit_Zaehler_3_0_sig_out_Q0 : STD_LOGIC;
  signal circuit_Zaehler_3_0_sig_out_Q1 : STD_LOGIC;
  signal circuit_Zaehler_3_0_sig_out_null : STD_LOGIC;
  signal circuit_or_0_sig_out_0 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal k1_start_1 : STD_LOGIC;
  signal reset_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Operationswerk_0_OUTBUS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  A(3 downto 0) <= Operationswerk_0_A_out(3 downto 0);
  COUNTER(1 downto 0) <= xlconcat_1_dout(1 downto 0);
  CS(12 downto 0) <= xlconcat_0_dout(12 downto 0);
  Done <= Steuerwerk_Moore_0_DONE;
  INBUS_1(3 downto 0) <= INBUS(3 downto 0);
  M(3 downto 0) <= Operationswerk_0_M_out(3 downto 0);
  Q(3 downto 0) <= Operationswerk_0_Q_out(3 downto 0);
  Sign <= Operationswerk_0_S_out;
  clk_1 <= clk;
  k1_start_1 <= k1_start;
  reset_1 <= reset;
Operationswerk_0: component SimulationBD_Automat_Operationswerk_0_0
     port map (
      A_out(3 downto 0) => Operationswerk_0_A_out(3 downto 0),
      INBUS(3 downto 0) => INBUS_1(3 downto 0),
      M_out(3 downto 0) => Operationswerk_0_M_out(3 downto 0),
      OUTBUS(3 downto 0) => NLW_Operationswerk_0_OUTBUS_UNCONNECTED(3 downto 0),
      Q_out(3 downto 0) => Operationswerk_0_Q_out(3 downto 0),
      S_out => Operationswerk_0_S_out,
      c0 => Steuerwerk_Moore_0_c0,
      c10 => Steuerwerk_Moore_0_c10,
      c11 => Steuerwerk_Moore_0_c11,
      c12 => Steuerwerk_Moore_0_c12,
      c2 => Steuerwerk_Moore_0_c2,
      c3 => Steuerwerk_Moore_0_c3,
      c4 => Steuerwerk_Moore_0_c4,
      c5 => Steuerwerk_Moore_0_c5,
      c6 => Steuerwerk_Moore_0_c6,
      c7 => Steuerwerk_Moore_0_c7,
      c9 => Steuerwerk_Moore_0_c9,
      clock => util_vector_logic_0_Res(0),
      k2 => Operationswerk_0_k2
    );
Steuerwerk_Moore_0: component SimulationBD_Automat_Steuerwerk_Moore_0_0
     port map (
      DONE => Steuerwerk_Moore_0_DONE,
      c0 => Steuerwerk_Moore_0_c0,
      c1 => Steuerwerk_Moore_0_c1,
      c10 => Steuerwerk_Moore_0_c10,
      c11 => Steuerwerk_Moore_0_c11,
      c12 => Steuerwerk_Moore_0_c12,
      c2 => Steuerwerk_Moore_0_c2,
      c3 => Steuerwerk_Moore_0_c3,
      c4 => Steuerwerk_Moore_0_c4,
      c5 => Steuerwerk_Moore_0_c5,
      c6 => Steuerwerk_Moore_0_c6,
      c7 => Steuerwerk_Moore_0_c7,
      c8 => Steuerwerk_Moore_0_c8,
      c9 => Steuerwerk_Moore_0_c9,
      clock => clk_1,
      k1 => k1_start_1,
      k2 => Operationswerk_0_k2,
      k3 => circuit_Zaehler_3_0_sig_out_null,
      reset => reset_1
    );
circuit_Zaehler_3_0: component SimulationBD_Automat_circuit_Zaehler_3_0_0
     port map (
      sig_in_Reset => circuit_or_0_sig_out_0,
      sig_in_Text => util_vector_logic_0_Res(0),
      sig_in_incCnt => Steuerwerk_Moore_0_c8,
      sig_out_Q0 => circuit_Zaehler_3_0_sig_out_Q0,
      sig_out_Q1 => circuit_Zaehler_3_0_sig_out_Q1,
      sig_out_null => circuit_Zaehler_3_0_sig_out_null
    );
circuit_or_0: component SimulationBD_Automat_circuit_or_0_0
     port map (
      sig_in_0 => Steuerwerk_Moore_0_c1,
      sig_in_1 => reset_1,
      sig_out_0 => circuit_or_0_sig_out_0
    );
util_vector_logic_0: component SimulationBD_Automat_util_vector_logic_0_0
     port map (
      Op1(0) => clk_1,
      Res(0) => util_vector_logic_0_Res(0)
    );
xlconcat_0: component SimulationBD_Automat_xlconcat_0_0
     port map (
      In0(0) => Steuerwerk_Moore_0_c0,
      In1(0) => Steuerwerk_Moore_0_c1,
      In10(0) => Steuerwerk_Moore_0_c10,
      In11(0) => Steuerwerk_Moore_0_c11,
      In12(0) => Steuerwerk_Moore_0_c12,
      In2(0) => Steuerwerk_Moore_0_c2,
      In3(0) => Steuerwerk_Moore_0_c3,
      In4(0) => Steuerwerk_Moore_0_c4,
      In5(0) => Steuerwerk_Moore_0_c5,
      In6(0) => Steuerwerk_Moore_0_c6,
      In7(0) => Steuerwerk_Moore_0_c7,
      In8(0) => Steuerwerk_Moore_0_c8,
      In9(0) => Steuerwerk_Moore_0_c9,
      dout(12 downto 0) => xlconcat_0_dout(12 downto 0)
    );
xlconcat_1: component SimulationBD_Automat_xlconcat_1_0
     port map (
      In0(0) => circuit_Zaehler_3_0_sig_out_Q0,
      In1(0) => circuit_Zaehler_3_0_sig_out_Q1,
      dout(1 downto 0) => xlconcat_1_dout(1 downto 0)
    );
end STRUCTURE;
