.model small
.stack 100
.data
    tb1 db "Hay go 1 phim: $"
    tb2 db "Ky tu nhan duoc la: $"
    crlf db 13,10 ,'$'
    input db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
 
        lea dx, tb1
        mov ah, 09h
        int 21h  
        
        ; ham 7 ngat 21h: nhap vao 1 ky tu nhung khong hien ky tu do ra man hinh
        mov ah, 07h
        int 21h
        mov input, al
        
        
        lea dx, crlf
        mov ah, 09h
        int 21h
        
        lea dx, tb2
        mov ah, 09h
        int 21h
        
        
        mov ah, 02h
        mov dl, input 

        int 21h              
 
        mov ah, 4ch
        int 21h
    main endp
end main