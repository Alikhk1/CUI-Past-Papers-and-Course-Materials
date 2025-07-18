.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 1, 2, 3  ; Array of size 3
    ARR_LEN equ $ - OFFSET ARR  ; Length of the array
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize sum to 0
    MOV CX, ARR_LEN  ; Set loop counter to the length of the array
    MOV BX, 0        ; Initialize BX to hold the sum    
    LEA SI, ARR
    
SUM_LOOP:
    MOV AL,[SI]   ; Load the current element of the array
    ADD BL, AL              ; Add the current element to the sum   
    INC SI
    LOOP SUM_LOOP           ; Repeat for all elements of the array
    
    ; Convert the sum to ASCII and display the result
    MOV DL, BL            ; Move the ASCII character to DL for display   
    ADD DL,48
    MOV AH, 2             ; Function to display character
    INT 21H               ; Display the sum character

    ; Exit the program
    MOV AH, 4CH           ; Set AH to 4CH for exit
    INT 21H               ; Call DOS interrupt to exit
MAIN ENDP
END MAIN
