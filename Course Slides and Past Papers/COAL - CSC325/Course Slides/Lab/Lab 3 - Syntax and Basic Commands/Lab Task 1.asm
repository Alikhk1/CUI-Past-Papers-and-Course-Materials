

Mov	AX, 30h		; 30h Stored in AX.

Mov	BX, 20h     ; 20h stored in BX.    

Add	BX, AX      ; AX and BX are added, RESULT: 50h is stored in BX.   

Mov	[30], BX    ; Value of BX, 50h is copied to memory location 30     

Mov	BX,20h      ; 20h is stored in BX.

Sub	Ax, BX      ; AX and BX Are subtracted, RESULT: 10h stored in AX.

Mov	[31], AX    ; Value of Ax is copied to memory location 31.

Mov DX, [30]
Mov [0150h], DX ; Moving the result of Addition.

Mov DX, [31]
Mov [0151h], DX ; Moving the Result of Subtraction.

