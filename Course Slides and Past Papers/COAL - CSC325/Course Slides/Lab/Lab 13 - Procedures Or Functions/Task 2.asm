; Program to print alphabets in reverse order using 8086 Assembly language
; Assume that the code segment starts at address 0000h and data segment at 1000h

.model small
.stack 100h

.data
    ; No data required for this program

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Initialize the starting character 'Z' into register
    mov cx, 26          ; Counter for 26 alphabets
    mov dl, 'Z'         ; Start with ASCII value of 'Z'

print_loop:
    ; Output the character in DL
    mov ah, 02h         ; Function to print character in DL
    int 21h             ; DOS interrupt to print character

    ; Decrement the character
    dec dl              ; Move to previous character in ASCII

    ; Decrement the counter
    loop print_loop     ; Loop until CX = 0

    ; Exit to DOS
    mov ah, 4Ch         ; DOS function to terminate program
    int 21h

main endp
end main
MAIN
