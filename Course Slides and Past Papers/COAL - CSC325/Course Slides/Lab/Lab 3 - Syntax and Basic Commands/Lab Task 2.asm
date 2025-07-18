Mov [31], 10h
Mov [32], 2Ah
Mov [33], 12h
Mov [34], 6h
Mov [35], 11h
Mov [36], 9h        ; Storing Values in Memory Locations   
 
Mov DX, [31] 
Add DX,[34]       ; Add the contents at memory location 31h & 34h   
Mov [40],DX       ; store and show result at memory location 40h  

                  
Mov CX, [32]     ; Subtract the contents at memory location 32h & 35h             
Sub CX, [35]     ; store and show result in register BX  
Mov BX,CX
                                                             
Mov DX, [33]                 ; Add the contents at memory location 33h & 36h
Add DX, [36]                 ; and show result at memory location 0120h?                                            
Mov [0120h], DX                                                             
                                                          
