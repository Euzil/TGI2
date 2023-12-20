.equ LED,           0x1F0
.equ SWITCH,        0x1F4
.equ CLOCK_CMP,     0x1F8
.equ SEG,           0x1FC

#define factor1     x10
#define factor2     x11
#define temp        x1

//li factor1, 10
//li factor2, 7

// define other name alias
#define temp2       x5
#define temp3       x6
#define temp4       x7
#define temp5       x27
#define temp6       x28
#define temp7       x29
#define temp8       x30
#define lowerprod   x12
#define upperprod   x13
#define upperprodu  x14

//Initalwerte
li factor1, -2
li factor2, 3

main:
li temp, 1
sltz temp2, factor1 //pruefe ob factor1 negativ ist
sltz temp3, factor2 //pruefe ob factor2 negativ ist
or temp4, temp3, temp2
beq temp4, zero, mul //wenn beide positiv dann rechen
and temp4, temp2, temp3
bne temp4, zero, negation3 //wenn beide negativ dann beide negieren
beq temp3, temp, negation2 // wenn factor2 negativ dann fac2 negieren
j negation1 // sonst factor1 negieren

negation1: //faktor1 negieren
li temp, 0
li temp2, 0
li temp3, 1
li temp4, 1
neg factor1, factor1
j mul

negation2: //faktor2 negieren
li temp, 0
li temp2, 0
li temp3, 1
li temp5, 1
neg factor2, factor2
j mul

negation3: //faktor1 und faktor2 negieren
li temp, 0
li temp2, 0
li temp3, 0
li temp4, 1
li temp5, 1
neg factor1, factor1
neg factor2, factor2
j mul

mul: //clear von temp , beginn der addition
li temp, 0
add temp2, zero, factor2
j loopmul

loopmul: //summenschleife
add temp, temp, factor1
add temp2, temp2, -1
bne temp2, zero, loopmul
j ergebnis

ergebnis: //schreibe ergebnis in lowerprod
add lowerprod, zero, temp
j mulh

mulh:
li temp, 0
add temp2, zero, factor2
j mulhloop

mulhloop:
add temp, temp, factor1
add temp2, temp2, -1
sltu temp6, temp, factor1
add temp7, temp7, temp6
bne temp2, zero, mulhloop
bne temp4, zero, correction
bne temp5, zero, correction
j ergebnish

correction: // Berichtigung der summe falls ein oder beide faktoren negativ waren
beq temp3, zero, fac1
not temp7, temp7
neg temp, temp
sltiu temp6, temp, 1
add temp7, temp7, temp6
fac1:
beq temp4, zero, fac2
neg factor1, factor1
fac2:
beq temp5, zero, ergebnish
neg factor2, factor2

ergebnish: // schreibe korrigierte summe in lower und upperprod
add lowerprod, zero, temp
add upperprod, zero, temp7
li temp, 0
li temp2, 0
li temp3, 0
li temp4, 0
li temp5, 0
li temp6, 0
li temp7, 0

mulhu:
li temp, 0
add temp2, zero, factor2
j mulhuloop

mulhuloop:
add temp, temp, factor1
add temp2, temp2, -1
sltu temp6, temp, factor1
add temp7, temp7, temp6
bne temp2, zero, mulhuloop
j ergebnisu

ergebnisu:
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