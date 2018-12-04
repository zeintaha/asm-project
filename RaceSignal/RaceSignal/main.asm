;
; RaceSignal.asm
;
; Created: 11/30/2018 11:56:01
; Author : nadee
;


; Replace with your application code

;Physical connection
;PD1 to button to ground (button)
;PB0 to red led to 220 ohams to ground (Red)
;PA0 to yellow led to 220 ohams to ground (Yellow)
;PC0 to green led to 220 ohams to ground (Green)
.macro delay
	ldi r20, 100
delay_loop_1:
	ldi r21, 200
delay_loop_2:
	ldi r22, 250
delay_loop_3:
	dec r22
	brne delay_loop_3
	dec r21
	brne delay_loop_2
	dec r20
	brne delay_loop_1
.endmacro

.def    temp1=r16 
.def	temp2=r23     
Initial:    
   ser    temp1        
   out    DDRB,temp1 ; RED_LED                        
   out	  DDRA,temp1	; YELLOW_LED
   out	  DDRC,temp1	; GREEN_LED
  button:   
   clr    temp1         ; clear register
   in   temp1,PinD; in for button to PD0
   SBRS temp1, 0
   jmp Main
   LEDS_OFF:
	ldi temp2, 0x00
	out PORTA, temp2
	out PORTB, temp2
	out PORTC, temp2
	
	rjmp button
Main:
   ldi temp2, 0xFF
   out PORTB, temp2 ; out for RED_LED to PB0
   delay
   out	portA,temp2 ; out for YELLOW_LED to PA0
	delay
	ldi r18, 0x00
	out PORTA, r18
	out PORTB, r18
	out PORTC, temp2 ; out for GREEN_LED to PC0
	delay
  rjmp LEDS_OFF