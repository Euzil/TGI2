.equ LED,           0x1F0                                                                                                                                                               
.equ SWITCH,        0x1F4
.equ CLOCK_CMP,     0x1F8
.equ SEG,           0x1FC

#define factor1     x10
#define factor2     x11
#define temp        x1
// define other name alias

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


li factor1, -2
li factor2, 3

// CODE HERE
mul:
li temp, 1
sltz temp2, factor1 //factor1 negativ prüfung
sltz temp3, factor2 //factor2 negativ prüfung
or temp4, temp3, temp2 
beq temp4, zero, positive // wenn beide pos direkt rechnen
and temp4, temp2, temp3 // wenn beide negativ beide negieren
bne temp4, zero, negative3 
beq temp3, temp, negative2

negative: // mache factor1 positiv
li temp, 0
li temp2, 0
li temp3, 1
li temp4, 1
neg factor1, factor1
j positive

negative2: // mache factor2 positiv
li temp, 0
li temp2, 0
li temp3, 1
li temp5, 1
neg factor2, factor2
j positive

negative3: // mache beide factor positiv
li temp, 0
li temp2, 0
li temp3, 0
li temp4, 1
li temp5, 1
neg factor1, factor1
neg factor2, factor2


positive: 
li temp, 0
add temp2, zero, factor2
loopmul: // berechne produkt aus summenschleife
add temp, temp, factor1
add temp2, temp2, -1

// mulh eingeschoben
sltu temp6, temp, factor1
add temp7, temp7, temp6

bne temp2, zero, loopmul

bne temp4, zero, correction
bne temp5, zero, correction
j produkt

correction: // korrigiere negierte factoren für ggf. weiteren code
beq temp3, zero, fac1
not temp7, temp7 // gehört zum mulh einschub
neg temp, temp
sltiu temp6, temp, 1
add temp7, temp7, temp6
fac1:
beq temp4, zero, fac2
neg factor1, factor1
fac2:
beq temp5, zero, produkt
neg factor2, factor2

produkt:
add lowerprod, zero, temp
add upperprod, zero, temp7 // gehört zum mulh einschub
li temp, 0
li temp2, 0
li temp3, 0
li temp4, 0
li temp5, 0
li temp6, 0
li temp7, 0


mulhu:
add temp2, zero, factor2
loopmulhu: // berechne produkt aus summenschleife
add temp, temp, factor1
add temp2, temp2, -1

// mulh
sltu temp6, temp, factor1
add temp7, temp7, temp6

bne temp2, zero, loopmulhu

produktu:
add upperprodu, zero, temp7
li temp, 0
li temp2, 0
li temp6, 0
li temp7, 0

// Turn on Auto-Clock with (4000000/(_SPEED_ + 1)) Hz 
// li   x10, _SPEED_
// sw   x10, CLOCK_CMP(x0)

// Turn off Auto-Clock
// sw   x0, CLOCK_CMP(x0)

// Initialize Clock Speed; This must be the last Inst
// .org CLOCK_CMP
// .word _SPEED_