.model small
.stack 100h

.data
    ; Define the string arrays
    string1 db 'Hello$'
    string2 db 'Hellz$'

.code
    main:
    ; Set up data segment (DS) and extra segment (ES) registers
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Modify the middle letter of the second string
    mov si, offset string2   ; Load address of string2 into SI
    add si, 2                ; Move SI to the middle of the string
    mov byte ptr [si], 'o'   ; Change the middle letter to 'o'

    ; Compare the two strings
    mov cx, 5                ; Set CX to the length of the strings (excluding the null terminator)
    lea si, string1          ; Load address of the first string into SI
    lea di, string2          ; Load address of the second string into DI
    cld                       ; Clear Direction Flag (to move forward through the strings)
    repe cmpsb               ; Compare strings byte by byte until CX becomes zero or a mismatch is found

    ; Check if strings are equal
    jz stringsEqual          ; If strings are equal, jump to stringsEqual

    ; Strings are not equal
    mov ah, 4Ch              ; Exit program with return code 0
    int 21h

    stringsEqual:
    ; Strings are equal
    mov ah, 4Ch              ; Exit program with return code 0
    int 21h

end main
