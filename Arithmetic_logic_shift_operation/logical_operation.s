      AREA MYCODE,CODE
		    ENTRY
			EXPORT __main

; Define the logical operations function
LogicalOperations
        PUSH {LR}       ; Save the return address
        CMP R2, #0x10000 ; Check if operand 1 is 16-bit or 32-bit
        BHI LogicalOperations32 ; Branch to 32-bit operations if true

; 16-bit operations
        ; AND operation
        AND R2, R0, R1       

        ; OR operation
        ORR R3, R0, R1       

        ; NOR operation
        MVN R4, R0           
        MVN R5, R1           
        AND R6, R4, R5       
        AND R6,R6, #0x000F
        ; NAND operation
        AND R7, R0, R1       
        MVN R7, R7 
        AND R6,R6, #0x000F		

        ; XOR operation
        EOR R8, R0, R1       

        ; XNOR operation
        EOR R9, R0, R1       
        MVN R9, R9
        AND R6,R6, #0x000F		

        B ExitLogicalOperations     ; Branch to exit the function

; 32-bit operations
LogicalOperations32
       ; AND operation
        AND R2, R0, R1       

        ; OR operation
        ORR R3, R0, R1      

        ; NOR operation
        MVN R4, R0           
        MVN R5, R1           
        AND R6, R4, R5
        AND R6,R6, #0x0000000F		

        ; NAND operation
        AND R7, R0, R1       
        MVN R7, R7
        AND R7,R7, #0x0000000F		

        ; XOR operation
        EOR R8, R0, R1       

        ; XNOR operation
        EOR R9, R0, R1       
        MVN R9, R9  
        AND R9,R9, #0x0000000F		

ExitLogicalOperations
        POP {PC}            ; Restore the return address and return


__main
        ; Perform logical operations on two 16-bit variables
        ;LDR R0, =0x0003 
        ;LDR R1, =0x0005 
        ;MOV R2, #0x10000 ; Set flag for 16-bit operations
        ;BL LogicalOperations    ; Call the logical operations function

        ; Perform logical operations on two 32-bit variables
        LDR R0, =0x0000000A 
        LDR R1, =0x00000006
        MOV R2, #0x20000 ; Set flag for 32-bit operations
        BL LogicalOperations  
stop B stop

END
