.model small
.stack 100
.data         
    tb1 db  'Nhap vao 1 ky tu: $'
    tb2 db  'Ky tu ke truoc: $'
    tb3 db  'Ky tu ke sau: $'
    crlf db 13,10,'$'
    input db ?
    
.code
   main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, tb1
        int 21h
        
        mov ah, 01h
        int 21h
        mov input, al
        
        mov ah, 09h
        lea dx, crlf
        int 21h
        
        mov ah, 09h
        lea dx, tb2
        int 21h
        
        dec input
        mov ah, 02h
        mov dl, input
        int 21h
        
        mov ah, 09h
        lea dx, crlf
        int 21h 
        
        mov ah, 09h
        lea dx, tb3
        int 21h
        
        add input, 2 
        mov ah, 02h
        mov dl, input
        int 21h
        
        
        mov ah, 4ch
        int 21h
    
   main endp

end