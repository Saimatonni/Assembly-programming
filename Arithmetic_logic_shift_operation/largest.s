    AREA data, DATA, READWRITE
num EQU 5
maxi EQU -1000
arr DCD 3,9,5,4,-1
	AREA MYCODE, CODE, READONLY
		ENTRY
		EXPORT main
main
	LDR R0, =num
	LDR R1, =arr
	LDR R5, =maxi
	
myloop 
	SUBS R0,R0,#1
	BEQ stop 
	LDR R4, [R1]
	CMP R4, R5
	BGT u_max
	B conti
	
u_max 
	MOV R5,R4

conti
	ADD R1,R1,#4
	B myloop
	
stop B stop
	END
