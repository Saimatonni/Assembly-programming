       AREA MYCODE,CODE
		    ENTRY
			EXPORT __main
			
__main
       MOV r1, #12
	   MOV r2, #4
	   MOV r3, #5
	   SUB r4, r1, r2
	   SUB r0,r4,r3
	 
stop B stop
      END
