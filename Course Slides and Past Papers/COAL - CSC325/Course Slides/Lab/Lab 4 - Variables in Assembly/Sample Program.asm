        .MODEL SMALL
        .STACK 100H
        .DATA
        NUM1 DB 2
        
        NUM2 DB 4
        DIVIDEND DW 17
        DIVISOR DB 5
        REMAINDER DB ?
        QUOTIENT DB ?
        .CODE
        MAIN PROC
        
        ; INITIALIZE THE DATA SEGMENT REGISTER TO USE VARIABLES
        
            MOV AX, @DATA
            MOV DS, AX
        
        ; MULTIPLY
        
            MOV AL, NUM1
            MOV BL, NUM2
            MUL BL
        ; OUTPUT RESULT (PRODUCT)
        
            MOV DL, AL ; RESULT IN AX REGISTER
            MOV AH, 2
            ADD DL, 48 ; GET ASCII VALUE OF THE RESULTANT DIGIT
            INT 21H
            
            MOV AX, DIVIDEND
            MOV CL, DIVISOR
            DIV CL
        
        ; AH HAS REMAINDER, AL HAS QUOTIENT
            MOV REMAINDER, AH
            MOV QUOTIENT, AL
            MOV AH, 2
            MOV DL, REMAINDER
            ADD DL, 48
            INT 21H
            MOV DL, QUOTIENT
            ADD DL, 48
            
            INT 21H
            
            MOV AH, 4CH ; RETURN CONTROL TO DOS/OS
            INT 21H
            MAIN ENDP
            END MAIN