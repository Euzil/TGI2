`timescale 1ns / 1ps

module TopModule_Automat(
    input         CLK,
    input  [ 4:0] BTN,
    output [ 3:0] DISP_AN,
    output [ 7:0] DISP_CAT,
    output [15:0] LD,
    input  [15:0] SW
);

    wire [ 3:0] _DISP_AN;  assign DISP_AN = _DISP_AN;             
    wire [ 7:0] _DISP_CAT; assign DISP_CAT = _DISP_CAT;             
    wire [15:0] _LD;       assign LD = _LD;         

    wire        vioActive;
    wire [15:0] vioSwitch;
    wire [ 4:0] vioButton;

    ExerciseBD_Automat exercise_inst (
        .CLK (CLK),

        // inputs
        .SW0  (vioActive ? vioSwitch[ 0] : SW[ 0]), 
        .SW1  (vioActive ? vioSwitch[ 1] : SW[ 1]), 
        .SW2  (vioActive ? vioSwitch[ 2] : SW[ 2]),   
        .SW3  (vioActive ? vioSwitch[ 3] : SW[ 3]),   
        .SW4  (vioActive ? vioSwitch[ 4] : SW[ 4]),   
        .SW5  (vioActive ? vioSwitch[ 5] : SW[ 5]),   
        .SW6  (vioActive ? vioSwitch[ 6] : SW[ 6]),   
        .SW7  (vioActive ? vioSwitch[ 7] : SW[ 7]),
        .SW8  (vioActive ? vioSwitch[ 8] : SW[ 8]), 
        .SW9  (vioActive ? vioSwitch[ 9] : SW[ 9]), 
        .SW10 (vioActive ? vioSwitch[10] : SW[10]), 
        .SW11 (vioActive ? vioSwitch[11] : SW[11]), 
        .SW12 (vioActive ? vioSwitch[12] : SW[12]), 
        .SW13 (vioActive ? vioSwitch[13] : SW[13]), 
        .SW14 (vioActive ? vioSwitch[14] : SW[14]), 
        .SW15 (vioActive ? vioSwitch[15] : SW[15]), 
        .BTNU (vioActive ? vioButton[0] : BTN[0]),
        .BTNR (vioActive ? vioButton[1] : BTN[1]),
        .BTND (vioActive ? vioButton[2] : BTN[2]),
        .BTNL (vioActive ? vioButton[3] : BTN[3]),
        .BTNC (vioActive ? vioButton[4] : BTN[4]),

        // outputs
        .LD0  (_LD[ 0]), 
        .LD1  (_LD[ 1]), 
        .LD2  (_LD[ 2]),   
        .LD3  (_LD[ 3]),   
        .LD4  (_LD[ 4]),   
        .LD5  (_LD[ 5]),   
        .LD6  (_LD[ 6]),   
        .LD7  (_LD[ 7]),
        .LD8  (_LD[ 8]), 
        .LD9  (_LD[ 9]), 
        .LD10 (_LD[10]), 
        .LD11 (_LD[11]), 
        .LD12 (_LD[12]), 
        .LD13 (_LD[13]), 
        .LD14 (_LD[14]), 
        .LD15 (_LD[15]), 
        .AN0  (_DISP_AN[0]),
        .AN1  (_DISP_AN[1]),
        .AN2  (_DISP_AN[2]),
        .AN3  (_DISP_AN[3]),
        .CA   (_DISP_CAT[0]),
        .CB   (_DISP_CAT[1]),
        .CC   (_DISP_CAT[2]),
        .CD   (_DISP_CAT[3]),
        .CE   (_DISP_CAT[4]),
        .CF   (_DISP_CAT[5]),
        .CG   (_DISP_CAT[6]),
        .DP   (_DISP_CAT[7])
    );

    wire [7:0] _Segment0;
    wire [7:0] _Segment1;
    wire [7:0] _Segment2;
    wire [7:0] _Segment3;

    SegmentEncoder seg_enc_inst(
        .CLK          (CLK),
        .InSegmentCat (_DISP_CAT),
        .InSegmentAn  (_DISP_AN),
        .OutSegment0  (_Segment0),
        .OutSegment1  (_Segment1),
        .OutSegment2  (_Segment2),
        .OutSegment3  (_Segment3)
    );

    vio_0 vio_inst(
        .clk        (CLK), 
        .probe_in0  ("BASYS_3"),
        .probe_in1  (0),
        .probe_in2  (_LD),
        .probe_in3  (_Segment0),
        .probe_in4  (_Segment1),
        .probe_in5  (_Segment2),
        .probe_in6  (_Segment3),
        .probe_out0 (vioActive),
        .probe_out1 (vioSwitch),
        .probe_out2 (vioButton) 
    );
endmodule
