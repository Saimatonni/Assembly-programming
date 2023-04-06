	AREA data,DATA,READWRITE
num EQU 5
SUM EQU 0
arr           DCD     2, 3, 4, 5, 6

	AREA MYCODE,CODE, READONLY
		
average_answer
		LDR     r0, =arr      
        LDR     r1, =num        
        LDR		r4, =SUM
		LDR 	r5, =num
		MOV     r2, #0   
	
loop
		LDR		r3, [r0]  
		ADD     r0,r0,#4
        ADD     r2, r2, r3    
        SUBS    r1, r1, #1      
        BNE     loop 
		SDIV 	r8, r2,r5
		
		BX LR
		
		
		EXPORT main
main
	 BL average_answer

	
stop B stop
	END
