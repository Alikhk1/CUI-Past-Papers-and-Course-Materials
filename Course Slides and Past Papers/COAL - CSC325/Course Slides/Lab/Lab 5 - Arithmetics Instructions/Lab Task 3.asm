





; Suppose Its 68 Degrees Fahrenheit

MOV AL, 68     
SUB AL, 32    ; Subtract 32 to convert to Celsius

MOV AH, 0     ; Clear AH
MOV BL, 5     
MUL BL        ; AL = AL * 5

MOV BL, 9
DIV BL        ; AL = AL / 9


MOV AH, AL    ; Moving The Answer to AH 
MOV AL, 68    ; Giving Original Fahrenheit Value to AL


   
   
   
   
 
