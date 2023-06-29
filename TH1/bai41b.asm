MOV AX, 8086 ; AH = 1F, AL = 96, gan gia tri 8086 cho thanh ghi ax
ADD AL, 3    ; AH =1F , AL = 99, AX = 1F99H 
DEC AX       ; AH =1F , AL = 98, AX = 1F98H
SUB AH, 10h  ; AH =0F , AL = 98, AX = 0F98H
AND AX, 0FF0h; AH = 0F, AL = 90, AX = 0F90H, la phep xor
 