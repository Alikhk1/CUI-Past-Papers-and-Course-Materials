.MODEL SMALL
.STACK 100H

.DATA
    prompt_msg DB "Enter three initials: $"
    newline DB 13, 10, '$' ; New line characters
    initials DB 3 DUP ('$') ; Array to store the initials
    row1 DB '***********$'
    row2 DB '*         *$'
    row3 DB '*         *$'
    row4 DB '*         *$'
    row5 DB '***********$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV AH, 09H
    MOV DX, OFFSET prompt_msg
    INT 21H

    ; Read three initials from the user
    MOV CX, 3 ; Initialize counter for reading initials
    MOV DI, OFFSET initials ; Start storing the initials
read_initials:
    MOV AH, 01H ; Function to read character
    INT 21H ; Read a character from the keyboard
    MOV [DI], AL ; Store the character in initials array
    INC DI ; Move to the next position in the array
    LOOP read_initials ; Continue until all initials are read

    ; Display the box of asterisks with the initials in the center
    MOV AH, 09H ; Function to display string
    LEA DX, row1 ; Load address of row1
    INT 21H ; Display row1

    ; Display a new line
    MOV DX, OFFSET newline
    INT 21H

    LEA DX, row2 ; Load address of row2
    INT 21H ; Display row2

    ; Display a new line
    MOV DX, OFFSET newline
    INT 21H

    LEA DX, row3 ; Load address of row3
    INT 21H ; Display row3

    ; Display a new line
    MOV DX, OFFSET newline
    INT 21H

    LEA DX, row4 ; Load address of row4
    INT 21H ; Display row4

    ; Display a new line
    MOV DX, OFFSET newline
    INT 21H

    LEA DX, row5 ; Load address of row5
    INT 21H ; Display row5

    ; Produce a beep sound
    MOV AH, 07H ; Function to produce beep sound
    INT 10H ; Produce a beep sound

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
