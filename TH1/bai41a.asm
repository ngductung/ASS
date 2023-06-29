MOV AH, 80 ; AX = 5000h, gan 050h cho AH        
MOV AL, 86 ; AX = 5056h, gan 056h cho AL
MOV BX, AX ; BH = 50, BL = 56, BX = AX = 5056, gan gia tri thanh ghi AX cho BX
MOV DH, BL ; DH = 56, DX = 5600h, gan gia tri tren BL cho DH
MOV DL, BH ; DL = 50, DX = 5650h, gan gia tri tren BH cho DL  
MOV SI, CS ; SI = 0100h = 256
