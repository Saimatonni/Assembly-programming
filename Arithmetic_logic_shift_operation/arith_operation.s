    export Operations
	export overflow_handle
	AREA data, DATA, READWRITE
res    DCD 0x00000000
variable3	 DCD 0x00000004
variable4 	 DCD 0x00000001
variable1	 DCD 0x7fffffff
variable2 	 DCD 0x1
variable5	 DCD 0x70000004
variable6 	 DCD 0x00000001
variable7	 DCD 0x9fffffff
variable8 	 DCD 0x00000001
	
	AREA MYCODE, CODE,READONLY
Operations	
	LDR R0,=variable1
	LDR R1,[R0]
	LDR R0, =variable2
	LDR R2,[R0]
	
	ADD R3,R1,R2 
	SUB R4,R1,R2 
	MUL R5, R1,R2 
	
	CMP r2, #0
   BEQ stop
   SDIV r6, r1, r2
	
stop BX LR
	B stop
	ENDP

overflow_handle
	LDR R0,=variable1
	LDR R1,[R0]
	LDR R0, =variable2
	LDR R2,[R0]
	
	ADDS R3,R1,R2 
   BVS Add_overflowed
SUBSTRACT 
	SUBS R4,R1,R2 
7   BVS sub_overflowed
	
MULTI
	MUL r5, r1, r2
	CMP r5, r5, ASR #31   ; Check the sign bit of r2
   BNE mul_overflowed          ; If sign bit is 1, then overflow occurred
DIVI	
	CMP r2, #0
    BEQ stop
    SDIV r6, r1, r2

Add_overflowed
	MOV R7,#1
	;LDR r7, = res
	;STR r3, [r7]
	B SUBSTRACT
sub_overflowed
	MOV R8,#1
	;LDR r8, = res
	;STR r4, [r8]
   B MULTI
mul_overflowed
	MOV R3,#0xffffffff
	LDR R9, = res
	STR r3, [r9]
   B DIVI
	
   B stop
    ENDP
   -------------------------main--------------
       import Operations
	import overflow_handle	
	AREA MYCODE2, CODE, READONLY	
		ENTRY 
		EXPORT main
main
	
	;BL Operations
	BL overflow_handle
stop B stop
	END
