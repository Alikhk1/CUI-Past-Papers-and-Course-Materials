 xor dh, dh      ; Clear DH register to store the count
    mov cx, 10      ; Set loop counter to 10 (number of iterations)

.loop:
    ; Your loop body goes here

    inc dh          ; Increment DH register to count iterations
    loop .loop      ; Loop until CX becomes zero
