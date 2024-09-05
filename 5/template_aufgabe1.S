.equ LED,    0x1F0
.equ SWITCH, 0x1F4
.equ SEG,    0x1FC

start:
    li x10, 10
    li x11, 7


# CODE HERE


endless:
    j endless
