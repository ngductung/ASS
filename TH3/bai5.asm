.model small
.stack 100
.data
        mang db 50,0, 50 dup('$') 
        xuong db 13,10,'$'
        Gach db ' - $'
        ktu db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
                 
        mov ah,0Ah
        lea dx,mang
        int 21h 
        
        lea dx,xuong
        mov ah,09
        int 21h
        
        lea si,mang+ 2
        mov cl, [mang + 1] 
        lap1:
            cmp [si],'A'
            Jl boqua
            cmp [si],'Z'
            JA boqua
            add [si],32
            
            boqua: 
            inc si
            loop lap1
        
        
        call xuat  
        lea dx,gach
        mov ah,9
        int 21h
        
        Lea si,mang + 2
        mov cl,[mang + 1]
        lap2:
            cmp [si],'a'
            Jl boqua2
            cmp [si],'z'
            JA boqua2
            sub [si], 32 
            
            boqua2:
                inc Si
            loop lap2
        
        call xuat
        
        mov ah,4ch
        int 21h          
    main endp 
    
    xuat PROC
        mov cl,[mang + 1]
        lea si,mang + 2
        lap:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop lap
        ret
   xuat endp
end main