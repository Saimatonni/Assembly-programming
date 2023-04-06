X EQU 9    
Y EQU 8 
Z EQU 5
	

       AREA MYCODE,CODE
		    ENTRY
			EXPORT __main
			
__main
       LDR r1, =X
	   LDR r2, =Y
	   LDR r3, =Z
	   ADD r4, r1, r2
	   ADD r0,r4,r3
	 
stop B stop
      END
