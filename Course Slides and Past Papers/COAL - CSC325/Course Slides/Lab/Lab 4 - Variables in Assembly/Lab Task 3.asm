

A DB 5
B DB 2

MOV AL, 5        ; AL = 5
MUL A            ; AL = 5 * 5
MOV A, AL        ; A = 25

MOV AL, 12       ; AL = 12
MUL B            ; AL = 12 * 2 
MOV B, AL        ; B = 24

     
MOV AL, A        ; AL = 25
SUB AL, B        ; AL = 25 - 24
MOV A, AL        ; A = 1 (Result)  




