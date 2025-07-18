.MODEL SMALL
.STACK 100H

.DATA
SOURCE_ARRAY DB 1, 2, 3, 4, 5
DEST_ARRAY DB 5 DUP (?)  ; Array to store copied elements
ARRAY_LEN EQU ($ - OFFSET SOURCE_ARRAY) / 2  ; Length of the array    
ARRAY_LEN2 EQU ($ - OFFSET DEST_ARRAY)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Copy elements from SOURCE_ARRAY to DEST_ARRAY
    MOV SI, OFFSET SOURCE_ARRAY  ; Point SI to the start of SOURCE_ARRAY
    MOV DI, OFFSET DEST_ARRAY    ; Point DI to the start of DEST_ARRAY
    MOV CX, ARRAY_LEN            ; Number of elements to copy

COPY_LOOP:
    MOV AX, [SI]     ; Load element from SOURCE_ARRAY into AX
    MOV [DI], AX     ; Store element in DEST_ARRAY
    ADD SI, 1       ; Move to the next element in SOURCE_ARRAY
    ADD DI, 1        ; Move to the next element in DEST_ARRAY
    LOOP COPY_LOOP   ; Repeat until all elements are copied

    ; Print the elements of DEST_ARRAY
    MOV AH, 2       
    LEA SI, DEST_ARRAY    
    MOV CX, ARRAY_LEN2               
    
    
DISPLAY_COPIED_ELEMENTS:
    MOV DX,[SI]
    ADD DX,48  
    INT 21H 
    
    ADD SI,1  
    LOOP DISPLAY_COPIED_ELEMENTS
    
    

    ; Exit the program
    
MAIN ENDP

END MAIN
