

    MOV AL, 12      ; Load AL with 12
    MOV BL, 6       ; Load BL with 6
    MUL BL          ; AL = AL * BL (12 * 6)
    
    MOV BL, 6       ; Load BL with 6
    MOV CL, 8       ; Load CL with 8
    DIV CL          ; AL = AL / CL (72 / 8)
    
    MOV BH, 0       ; Clear BH to ensure correct operation
    SUB AL, BL      ; AL = AL - BL (9 - 6)
                                   
    MOV BL, 15      ; Load BL with 15
    ADD AL, BL      ; AL = AL + BL (66 + 15)