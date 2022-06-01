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
#define MUL   (0b000 << 12)
#define MULH  (0b001 << 12)
#define MULHU (0b011 << 12)
#define temp2       x5
#define temp3       x6
#define temp4       x7
#define temp5       x28
#define temp6       x29
#define temp7       x30
#define temp8       x31
#define lowerprod   x12
#define upperprod   x13
#define upperprodu  x14

//.word (FUNCT7 | /*rs2*/ (11 << 20) | /*rs1*/ (10 << 15) | instr | /*rd*/ (12 << 7) | OPCODE);

li factor1, -2
li factor2, 3

.word (FUNCT7 | /*rs2*/ (11 << 20) | /*rs1*/ (10 << 15) | MUL | /*rd*/ (12 << 7) | OPCODE);
.word (FUNCT7 | /*rs2*/ (11 << 20) | /*rs1*/ (10 << 15) | MULH | /*rd*/ (12 << 7) | OPCODE);
.word (FUNCT7 | /*rs2*/ (11 << 20) | /*rs1*/ (10 << 15) | MULHU | /*rd*/ (12 << 7) | OPCODE);

// Turn on Auto-Clock with (4000000/(_SPEED_ + 1)) Hz 
// li   x10, _SPEED_
// sw   x10, CLOCK_CMP(x0)

// Turn off Auto-Clock
// sw   x0, CLOCK_CMP(x0)

// Initialize Clock Speed; This must be the last Inst
// .org CLOCK_CMP
// .word _SPEED_