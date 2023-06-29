.model small
.stack 100
.data 
    max db 200
    input db 200 dup('$') 
    crlf db 13,10,'$'  
    tb db 'Xin chao $'
.code
   main proc 
        mov ax, @data
        mov ds, ax
        
        ; input
        mov ah, 0ah
        lea dx, input
        int 21h
        
        ; ra xuong dong 
        mov ah, 09h
        lea dx, crlf
        int 21h
        
        ; in ra thong bao
        mov ah, 09h
        lea dx, tb
        int 21h
        
        ; cong 2 de bo qua byte do dai
        lea dx, input+2
        int 21h
        
        mov ah,4ch
        int 21h
   main endp
end