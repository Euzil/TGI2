`timescale 1ns / 100ps

`define DIVIDENT 'h7B
`define DIVISOR  'hE

module Testbench;
    reg       Clock;
    reg       Reset;
    reg [3:0] Inbus;
    reg       Start;

    wire        VZ_Done;
    wire  [1:0] VZ_Counter;
    wire  [0:0] VZ_S;
    wire  [3:0] VZ_A;
    wire  [3:0] VZ_Q;
    wire  [3:0] VZ_M;
    wire [12:0] VZ_CS;
    
    wire        AT_Done;
    wire  [1:0] AT_Counter;
    wire  [0:0] AT_S;
    wire  [3:0] AT_A;
    wire  [3:0] AT_Q;
    wire  [3:0] AT_M;
    wire [12:0] AT_CS;
   
    reg   [3:0] expected_A;
    reg   [3:0] expected_Q;

    // Instanciate Block Design
    SimulationBD_VZ tb_bd_inst_vz (
        .clk(Clock),
        .reset(Reset),

        .INBUS(Inbus),
        .k1_start(Start),
        
        .A(VZ_A),
        .Q(VZ_Q),
        .M(VZ_M),
        .Sign(VZ_S),
        .COUNTER(VZ_Counter),
        .CS(VZ_CS),
        
        .Done(VZ_Done)
    );

    // Instanciate Block Design
    SimulationBD_Automat tb_bd_inst_automat (
        .clk(Clock),
        .reset(Reset),

        .INBUS(Inbus),
        .k1_start(Start),
        
        .A(AT_A),
        .Q(AT_Q),
        .M(AT_M),
        .Sign(AT_S),
        .COUNTER(AT_Counter),
        .CS(AT_CS),
        
        .Done(AT_Done)
    );

    // Init
    initial begin 
        Clock = 0;
        Inbus = 'hZ;
        Start = 0;
        Reset = 0;
        
        expected_A = 'hZ;
        expected_Q = 'hZ;
    end
    
    // Clock Generator
    always begin
        #5 Clock = !Clock;
    end
    
    // Test Process
    initial begin
        Reset = 1;
        @(negedge Clock);
        @(negedge Clock);
        Reset = 0;
        @(negedge Clock);
        
        Start = 1;
        @(posedge Clock);
        Inbus = (`DIVIDENT >> 4);
        @(negedge Clock);
        Start = 0;
        @(posedge Clock);
        Inbus = (`DIVIDENT & 'hF);
        @(posedge Clock);
        Inbus = `DIVISOR;
        @(posedge Clock);
        Inbus = 'hZ;
        
        @(posedge VZ_Done or posedge AT_Done);
        expected_A = (`DIVIDENT % `DIVISOR);
        expected_Q = (`DIVIDENT / `DIVISOR);

        @(posedge Clock);
        @(posedge Clock);
        @(posedge Clock);
        @(posedge Clock);
        @(posedge Clock);
        @(posedge Clock);
        $finish;
    end

endmodule
