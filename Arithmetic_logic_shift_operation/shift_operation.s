      AREA MYCODE,CODE
		    ENTRY
			EXPORT __main
			
__main
       LDR R0, =0x00000013
	   ;logical shift right
	   LSR R1, R0, #2
	   ;Arithmatic shift right
       ASR R2, R0, #2
	   ;Logical shift left
       LSL R3, R0, #2	   
stop B stop
      END
