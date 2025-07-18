.MODEL SMALL
.STACK 100H
.DATA  
ARR     DW 1, 2, 3
ARR_LEN EQU ($ - OFFSET ARR) / 2  ; ARR_LEN WILL CONTAIN THE LENGTH OF THE ARRAY ELEMENTS

.CODE
MAIN PROC     
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 2           ; Function to print character
    LEA SI, ARR         ; Load effective address of ARR into SI
    ADD SI, (ARR_LEN-1)*2 ; Move SI to the last element of the array  
    MOV CX, ARR_LEN    ; Setting Loop Counter to Lenght Of array

NEXT:
    MOV DX, [SI]        ; Load the word from memory into DX
    ADD DX, 48          ; Convert the number to its ASCII representation
    INT 21H             ; Print the ASCII character

    SUB SI, 2           ; Move SI to the previous word in the array
    LOOP NEXT           ; Repeat for each element in the array

    ; Exit the program
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP 

END MAIN
