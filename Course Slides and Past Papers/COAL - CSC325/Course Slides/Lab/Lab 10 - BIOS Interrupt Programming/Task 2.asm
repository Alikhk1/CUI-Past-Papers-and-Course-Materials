.MODEL SMALL
.STACK 100H

.DATA
    prompt_msg DB "Enter a string (max 80 characters): $"
    output_msg DB 13, 10, "Converted string: $"
    input_buffer DB 80, ?, 80 dup('$')

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH, 09H
    MOV DX, OFFSET prompt_msg
    INT 21H

    ; Read input string
    MOV AH, 0AH
    MOV DX, OFFSET input_buffer
    INT 21H

    ; Convert string to upper case
    MOV SI, OFFSET input_buffer + 2 ; Offset past the length byte
convert_loop:
    MOV AL, [SI]
    CMP AL, 0
    JE convert_done
    CMP AL, 'a'
    JB skip_convert
    CMP AL, 'z'
    JA skip_convert
    SUB AL, 32 ; Convert lower case to upper case
    MOV [SI], AL
skip_convert:
    INC SI
    JMP convert_loop
convert_done:

    ; Display converted string
    MOV AH, 09H
    MOV DX, OFFSET output_msg
    INT 21H
    MOV AH, 09H
    MOV DX, OFFSET input_buffer + 2 ; Offset past the length byte
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
