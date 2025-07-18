   ; Swap SP and DI registers without using XCHG
    mov ax, sp       ; Move contents of SP to AX
    mov bx, di       ; Move contents of DI to BX
    mov sp, bx       ; Move contents of BX (originally DI) to SP
    mov di, ax       ; Move contents of AX (originally SP) to DI
         
                                  
                                  
    ; Swap SS and DS registers without using XCHG
    mov ax, ss       ; Move contents of SS to AX
    mov bx, ds       ; Move contents of DS to BX
    mov ss, bx       ; Move contents of BX (originally DS) to SS
    mov ds, ax       ; Move contents of AX (originally SS) to DS 
         
         
    
    ; Swap contents of memory locations without using XCHG
    mov bx, ABCDH    ; Move segment of ABCDH to BX
    mov es, bx       ; Set ES to segment of ABCDH
    mov bx, 2345h    ; Offset of ABCDH
    mov ax, es:[bx]  ; Load data from ABCDH:2345H to AX

    mov cx, 1234h    ; Move segment of 1234H to CX
    mov ds, cx       ; Set DS to segment of 1234H
    mov cx, 78DEh    ; Offset of 1234H
    mov dx, ds:[cx]  ; Load data from 1234H:78DEH to DX

    mov bx, ABCDH    ; Move segment of ABCDH to BX
    mov es, bx       ; Set ES to segment of ABCDH
    mov bx, 2345h    ; Offset of ABCDH
    mov es:[bx], dx  ; Move data from DX to ABCDH:2345H

    mov cx, 1234h    ; Move segment of 1234H to CX
    mov ds, cx       ; Set DS to segment of 1234H
    mov cx, 78DEh    ; Offset of 1234H
    mov ds:[cx], ax  ; Move data from AX to 1234H:78DEH