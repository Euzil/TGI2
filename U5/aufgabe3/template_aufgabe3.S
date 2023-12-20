.equ LED,           0x1F0
.equ SWITCH,        0x1F4
.equ CLOCK_CMP,     0x1F8
.equ SEG,           0x1FC

#define factor1     x10
#define factor2     x11
#define temp        x1
// define other name alias
#define FUNCT7  (0b0000001 << 25 )
#define OPCODE  (0b0110011 << 0 )

#define MUL   (0b000 << 12 )
#define MULH  (0b001 << 12)
#define MULHU (0b011 << 12)
#define res		x12

#define RECHNUNG(instr,factor1, factor2)\
.word (FUNCT7 | /*rs2*/ (11 << 20) | /*rs1*/ (10 << 15) | instr | /*rd*/ (12 << 7) | OPCODE); \
 /*instr x12, x10, x11;*/ \

 // mul
 RECHNUNG(MUL, 3, 5);//15
 RECHNUNG(MUL, 0xffffffff, 0xffffffff);//0x00000001

 //mulh
 RECHNUNG(MULH, 3, 5);//0
 RECHNUNG(MULH, 0xaaaaaaab, 0x0002fe7d);//0xffff0081


//li factor1, 10
//li factor2, 7

// CODE HERE




// Turn on Auto-Clock with (4000000/(_SPEED_ + 1)) Hz 
// li   x10, _SPEED_
// sw   x10, CLOCK_CMP(x0)

// Turn off Auto-Clock
// sw   x0, CLOCK_CMP(x0)

// Initialize Clock Speed; This must be the last Inst
// .org CLOCK_CMP
// .word _SPEED_