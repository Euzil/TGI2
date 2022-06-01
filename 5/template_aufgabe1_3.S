.equ LED,    0x1F0
.equ SWITCH, 0x1F4
.equ SEG,    0x1FC

start:
    li x10, 10
    li x11, 7


# CODE HERE
	li x7, 1
	sltz x5, x10				# Ist x10 negativ?
    sltz x6, x11				# Ist x11 negativ?
    beq x5, x7, negatex10
j1:
    beq x6, x7, negatex11
j2:
	li x28, 0
mult:
	beq x28, x11, undoNegation  # x28 = x11? (genau x11 Iterationen)
	add x12, x12, x10			# x12 = x12 + x10 (addiere x10 auf die aktuelle Summe)
    sltu x29, x12, x10			# x12 < x10? (Überlauf?)
    add x13, x13, x29			# x13 = x13 + x29 (Überlauf auf x13 addieren)
    add x28, x28, x7			# x28 + 1
    j mult

negatex10:						# Negiere x10
	neg x10, x10
    j j1

negatex11:						# Negiere x11
 	neg x11, x11
    j j2

undoNegation:
    xor x30, x5, x6 			# x5 xor x6 (Muss das Ergebnis negiert werden?)
    beq x30, x0, endless
    neg x12, x12				# Negiere x12
    not x13, x13				# Negiere x13

endless:
    j endless


#.word 0b0000001 01011 01010 000 01110 0110011 mul in x14
#.word 0b0000001 01011 01010 001 01111 0110011 mulh in x15

.word 0x2B50733
.word 0x2B517B3
