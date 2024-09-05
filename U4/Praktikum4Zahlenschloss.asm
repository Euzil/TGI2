/*
 * Praktikum4Zahlenschloss.asm
 *
 *  Created: 19.06.2019 15:14:58
 *   Author: andre
 */ 

 variablen:
 .def temp = R16
 .def digit = R20		; aktuell eingestellte Ziffer
 .def fail = R21
 .def bs = R22			; Detektion der fallenden Flanke an den Schaltern (buttonstates)
 .def LED = R23

 .dseg				;4 Ziffern des Zahlenschlosses
 .org $0060 
 ARRAY: .byte 4

 .cseg				;zurueck zum Codesegment
 .org $0000

 init:
 ldi temp, 0b00111111
 out DDRB , temp
 ldi temp, 0b00001111
 out DDRD , temp

 ldi temp, 0b01111110
 out DDRA , temp

 ldi temp, high(RAMEND)		; init
 out SPH, temp				; Stackptr
 ldi temp, low(RAMEND)		; to end
 out SPL, temp				; of RAM

 clr temp

 initArray:
 ldi ZH, high(PASSWORT<<1)
 ldi ZL, low(PASSWORT<<1)

 code:
 lpm r15, z   ;def z reg in pmem, lo
 lpm r15, z+  ;hi 



 MAIN:

 Zahl1:
 clr digit
 out PortD, digit
 ldi fail, 0
 ldi LED , 0b00000001
 out PortB, LED
 call POLL_BUTTONS	; Unterprogramm aufrufen
 lpm temp, z+		; lade mit z Adresse ersten Wert des Passwortes im ROM in temp zum Vergleich
 cp digit, temp		; digit mit erster ziffer des eingestellten codes vergleichen
 breq Zahl2			; wenn die erste Ziffer stimmt, wird die zweite Ziffer ueberprueft
 inc fail			; wenn nicht wird fail inkrementiert

 Zahl2:
 clr digit
 out PortD, digit
 ldi LED, 0b00000011
 out PortB, LED
 call POLL_BUTTONS
 lpm temp, z+		; 2 Wert des Passwortes
 cp digit, temp
 breq Zahl3
 inc fail

 Zahl3:
 clr digit
 out PortD, digit
 ldi LED, 0b00000111
 out PortB, LED
 call POLL_BUTTONS
 lpm temp, z+		;3 Wert des Passwortes
 cp digit, temp
 breq Zahl4
 inc fail

 Zahl4:
 clr digit
 out PortD, digit
 ldi LED, 0b00001111
 out PortB, LED
 call POLL_BUTTONS
 lpm temp, z+		; 4 Wert des Passwortes
 cp digit, temp		
 breq Ergebnis
 inc fail
 

 Ergebnis:
 cpi fail,0			; ueberpruefe ob fail ungleich 0 ist
 brne falsch

 richtig:				; alle Eingaben waren richtig, fail = 0
 ldi LED, 0b00011111
 out PortB, LED
 in bs, PinA
 cpi bs, 0b10000000		; wenn Taste losgelassen wird gehts weiter
 brne richtig			; wenn nicht -> Schleife
 
 flanker:
 in bs, PinA
 cpi bs, 0b10000000		; wenn Taste losgelassen wird, gehts weiter
 breq flanker			; wenn nicht -> Schleife
 clr bs
 jmp main
 
 falsch:				;falls fail groe�er als 1, also eingegebende Zahl ist falsch
 ldi LED, 0b00101111
 out PortB, LED
 in bs, PinA
 cpi bs, 0b10000000		; wenn Taste losgelassen wird, gehts weiter
 brne falsch			; wenn nicht -> Schleife
 clr fail
 ldi zh, high(PASSWORT<<1)
 ldi zl, low(PASSWORT<<1)
 jmp flanker


 ; Unterprogramm: Einstellen der Zahl
 POLL_BUTTONS:
 start:
 in bs, PinA
 andi bs, 0b10000000	; wenn Taste gedrueckt -> Eingabe fertig
 brne done
 in bs, PinA
 andi bs, 0b00000001	; ueberpruefe ob steigende Flanke gedrueckt ist, wenn ja Zahl erhoehen
 breq start				; wenn nicht -> Schleife

 flanke: 
 in bs, PinA
 com bs					; invertieren, um das letze Bit auf 1 testen zu koennen
 andi bs, 0b00000001	; ueberpruefe, ob fallende Flanke kommt
 breq flanke			; wenn Taste nicht losgelassen wird -> Schleife

 cpi digit, 9			
 breq resetdigit		; wenn digit = 9, wird digit zurueckgesetzt
 inc digit
 out PortD, digit
 jmp start

 resetdigit:
 ldi digit,0
 jmp start

 done:
 in bs, PinA
 cpi bs, 0b10000000		; wenn Taste = false, -> Schleife
 breq done					
 ret					; wenn Taste gedrueckt -> Unterprogramm zu Ende
 



 PASSWORT: .db 2 , 7 , 2 , 7









