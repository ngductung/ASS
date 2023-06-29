.model small
.stack 100
.data
    filename db 250 dup ("$")
    tmp db 250 dup("$")
    tb db "Nhap ten file: $"
    filetag dw ?
     
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, tb
        int 21h
        
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea si, tmp+2
        mov di, 0
        lap:
            mov bl, [si]
            cmp bl, 13
            je exit:
            mov filename[di], bl
            inc di
            inc si
            jmp lap
            exit:
                mov filename[di], 0
        
        mov ah, 3ch
        lea dx, filename
        mov cx, 0
        int 21h 
        mov filetag, ax
        
        mov ah, 3eh
        mov bx, filetag
        int 21h         
        
        mov ah, 41h
        lea dx, filename
        int 21h  
        
        mov ah, 41h
        lea dx, filename
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end