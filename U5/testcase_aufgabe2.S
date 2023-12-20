.equ LED,    0x1F0
.equ SWITCH, 0x1F4
.equ SEG,    0x1FC

.macro testcase, testnum, instr, res, val1, val2
    testcase_\testnum: 
        li  x1, \testnum # use x1 to see which testcase failed
        li x10, \val1
        li x11, \val2
        # the compiler does not know the mul/mulh/mulhu
        # so we have to write the binary representation
        # of the instruction into the memory
        .word \instr
        li x13, \res
        bne x12, x13, test_fail
.endm

.equ MUL,   0x02b50633  # mul   x12, x10, x11
.equ MULH,  0x02b51633  # mulh  x12, x10, x11
.equ MULHU, 0x02b53633  # mulhu x12, x10, x11

# generate testcases
    #   test-nr, instr,     result,     value1,     value2
    testcase  1, MUL,           15,          3,          5
    testcase  2, MUL,   0x0000ff7f, 0xaaaaaaab, 0x0002fe7d
    testcase  3, MUL,   0x00000001, 0xffffffff, 0xffffffff
    testcase  4, MUL,   0xffffffff, 0x00000001, 0xffffffff
    testcase  5, MULH,           0,          3,          5
    testcase  6, MULH,  0xffff0081, 0xaaaaaaab, 0x0002fe7d
    testcase  7, MULH,  0x00000000, 0xffffffff, 0xffffffff
    testcase  8, MULH,  0xffffffff, 0x00000001, 0xffffffff
    testcase  9, MULHU,          0,          3,          5
    testcase 10, MULHU, 0x0001fefe, 0xaaaaaaab, 0x0002fe7d
    testcase 11, MULHU, 0xfffffffe, 0xffffffff, 0xffffffff
    testcase 12, MULHU, 0x00000000, 0x00000001, 0xffffffff

test_succ:
    li x31, 0x6D3E3939
    sw x31, SEG(x0)
    j  endless

test_fail:
    li x31, 0x71770638
    sw x31, SEG(x0)

endless:
    j endless
