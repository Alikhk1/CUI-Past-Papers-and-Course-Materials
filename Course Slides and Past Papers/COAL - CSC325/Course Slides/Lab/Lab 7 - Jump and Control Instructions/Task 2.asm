_start:
    mov ah, 7        ; Sample input value in AH register

    mov al, ah       ; Move the contents of AH register to AL
    and al, 1        ; Perform bitwise AND operation 

    jnz odd_number   ; Jump if AL is not zero (indicating AH contains an odd number)
    
    ; If the number is even
    mov bl, 0        ; Place 0 in BL register
    jmp end_program  ; Jump to end of the program

odd_number:
    ; If the number is odd
    mov bl, 1        ; Place 1 in BL register

end_program:
    