.model small
.stack 100
.data
    str1 dw "Khong co gi quy hon doc lap tu do"             
    str2 dw 34 dup ("$")
    
.code
    main proc 
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        cld
        
        mov cx, 33
        lea si, str1
        lea di, str2
        
        rep movsb
        
        mov ah, 09h
        lea dx, str2
        
        int 21h
        mov ah, 08h
        
        int 21h   
        mov ah, 4ch
        int 21h
    main endp
end