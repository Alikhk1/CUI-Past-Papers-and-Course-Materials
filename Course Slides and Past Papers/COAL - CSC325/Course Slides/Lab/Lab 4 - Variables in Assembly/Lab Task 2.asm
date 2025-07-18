



; Add and subtract the contents(16bit) of two memory locations
; A=5*A-12*B

A DW 3
B DW 1

MOV AX, 5        ; AL = 5
MUL A            ; AL = 5 * 3
MOV A, AX        ; A = 15

MOV AX, 12       ; AL = 12
MUL B            ; AL = 12 * 1 
MOV B, AX        ; B = 12

     
MOV AX, A        ; AL = 15
SUB AX, B        ; AL = 15 - 12
MOV A, AX        ; A = 3 (Result)    
                                        
                                        
                                        
                                        
; Multiply two 16-bit numbers and store the result in some variable 
; at a memory location.             

    num1 DW 1234h   ; Define 16-bit number 1
    num2 DW 5678h   ; Define 16-bit number 2
    result DW ?     ; Define variable to store result (initialize to 0)
    
    mov ax, [num1]      ; Load number 1 into AX
    mov bx, [num2]      ; Load number 2 into BX
    mul bx              ; Multiply AX by BX
    mov [result], ax    ; Store the result in memory location result
                                                                     
                                                                     
                                                                     
                                                                     
; Calculate the average of numbers

MOV AL, 5
MOV BL, 5
ADD AL, BL
MOV BL, 2
DIV BL                                                                     