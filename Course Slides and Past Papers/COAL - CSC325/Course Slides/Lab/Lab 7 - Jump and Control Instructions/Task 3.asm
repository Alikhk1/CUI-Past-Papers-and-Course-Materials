                                  _start:
    ; Assign the numbers to AL, AH, BL, and BH registers
    mov al, 10      ; Sample numbers, you can change these values as needed
    mov ah, 20
    mov bl, 30
    mov bh, 40
    
    ; Call the ADDITION subroutine to add the numbers
    call ADDITION

    cwd             ; Sign-extend AX into DX:AX
    mov dx, 4       ; Divisor for calculating average
    idiv dx         ; Divide DX:AX by DX (quotient in AX, remainder in DX)
    mov cx, ax      ; Move the quotient (average) to CX 
    
    ADDITION:
    ; Add the contents of AL, AH, BL, and BH registers
    add al, ah      ; AL = AL + AH
    add al, bl      ; AL = AL + BL
    add al, bh      ; AL = AL + BH
    
    ; Return the sum in AL
    ret
   