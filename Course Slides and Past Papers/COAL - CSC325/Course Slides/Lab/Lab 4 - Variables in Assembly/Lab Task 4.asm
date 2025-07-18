  
  
  
  
 ; Translate the high-level language assignment statement A=30+5*A-12/B
 ; into assembly code  
 
       A DB ?      ; Vavriable A = 10 
       B DB ?      ; Variable  B = 2
       Temp DB ?   ; Define temporary variable for storing intermediate results
    
   
        
       ; Divide 12 by B
       MOV BL, B    ; BL = 2
       MOV AL, 12   ; AL = 12
       DIV BL       ; AL = 12 / 2 = 6
        
       ; Store the result of division in Temp
       MOV Temp, AL
 
        
       ; Multiply A by 5 
       MOV AL, A   ; AL = 10
       MOV BL, 5   ; BL = 5
       MUL BL      ; AL = 10 * 5 = 50
        
       ; Add 30 to the result
       ADD AL, 30h ; AL = 30 + 50
        
       ; SUB the result of (30 + 5*A) and Temp (12/B)
       SUB AL, Temp
        
       ; Store the final result in A
       MOV A, AL  
       
       
       
       
       