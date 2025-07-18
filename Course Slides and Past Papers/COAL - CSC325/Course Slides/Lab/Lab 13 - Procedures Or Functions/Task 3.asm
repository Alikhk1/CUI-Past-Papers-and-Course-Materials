; Program to print a multi-digit number using 8086 Assembly language
; Assume that the code segment starts at address 0000h and data segment at 1000h

.model small
.stack 100h

.data
    number dw 12345      ; Multi-digit number to print

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Load the number to AX
    mov ax, number

    ; Convert number to string
    mov bx, 10           ; Base 10 for decimal conversion
    xor cx, cx           ; Clear CX for digit count

convert_loop:
    xor dx, dx           ; Clear DX for division
    div bx               ; AX / 10, quotient in AX, remainder in DX
    push dx              ; Push remainder (digit) onto stack
    inc cx               ; Increment digit count
    test ax, ax          ; Check if quotient is zero
    jnz convert_loop     ; If not zero, continue loop

print_loop:
    pop dx               ; Pop digit from stack
    add dl, '0'          ; Convert to ASCII
    mov ah, 02h          ; Function to print character in DL
    int 21h              ; DOS interrupt to print character
    loop print_loop      ; Loop until CX = 0

    ; Exit to DOS
    mov ah, 4Ch          ; DOS function to terminate program
    int 21h

main endp
end main
