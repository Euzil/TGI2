`timescale 1ns / 1ps

module SegmentEncoder (
    input CLK,
    input [7:0] InSegmentCat,
    input [3:0] InSegmentAn,
    output reg [7:0] OutSegment0 = 0,
    output reg [7:0] OutSegment1 = 0,
    output reg [7:0] OutSegment2 = 0,
    output reg [7:0] OutSegment3 = 0
);
    always @(posedge CLK) begin
        if (InSegmentAn[0] == 0) OutSegment0 <= ~InSegmentCat;
        if (InSegmentAn[1] == 0) OutSegment1 <= ~InSegmentCat;
        if (InSegmentAn[2] == 0) OutSegment2 <= ~InSegmentCat;
        if (InSegmentAn[3] == 0) OutSegment3 <= ~InSegmentCat;
    end
endmodule
