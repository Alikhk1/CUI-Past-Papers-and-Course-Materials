MOV AX,16H
MOV BH,36
MOV SI,2345H
MOV BL,24H
MOV AX, BX
MOV CX, SI
MOV DS,CX
MOV AH,0CDH
XCHG AH,BH
XCHG CX,BX
MOV AX,1200H
MOV DS,AX
MOV [0004H],78H
