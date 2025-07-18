                   .model small
.stack 100h

.data
    ; Define the string arrays
    string1 db 'Allah-O-Akbar$'
    string2 db 'Allah-O-Akbar$'

.code
    main:
    ; Set up data segment (DS) and extra segment (ES) registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Move the first string to DS:1120h
    lea si, string1      ; Load address of string1 into SI
    mov di, 1120h        ; Destination offset address in DS
    call MoveString      ; Call subroutine to move the string

    ; Move the second string to ES:2310h
    lea si, string2      ; Load address of string2 into SI
    mov di, 2310h        ; Destination offset address in ES
    call MoveString      ; Call subroutine to move the string

    ; Compare the two strings
    mov cx, 11           ; Set CX to the length of the strings (excluding the null terminator)
    lea si, [1120h]      ; Load address of the first string into SI
    lea di, [2310h]      ; Load address of the second string into DI
    cld                  ; Clear Direction Flag (to move forward through the strings)
    repe cmpsb           ; Compare strings byte by byte until CX becomes zero or a mismatch is found
    jz stringsEqual      ; If strings are equal, jump to stringsEqual

    ; Strings are not equal
    mov ah, 4Ch          ; Exit program with return code 0
    int 21h

    stringsEqual:
    ; Strings are equal
    mov ah, 4Ch          ; Exit program with return code 0
    int 21h

MoveString:
    mov cx, 11            ; Set CX to the length of the string (excluding the null terminator)
    rep movsb             ; Move CX bytes from DS:SI to ES:DI
    ret


end main
