inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    tb1 db "Nhap ten file can ma hoa: $"
    filename db 250 dup("$")
    tmp db 250 dup ("$")
    filetag dw ?
    len db ?
    content db 250 dup ()
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea si, tmp+2
        mov di, 0
        lap:
            mov bl, [si]
            cmp bl, 13
            je exit
            mov filename[di], bl
            inc di
            inc si
            jmp lap
            exit:
                mov filename[di], 0
        
        mov ah, 3dh
        mov al, 2
        lea dx, filename
        int 21h
        mov filetag, ax
        
        mov ah, 3fh
        mov bx, filetag
        lea dx, content
        mov cx, 250
        int 21h
        ;inchuoi content
        
        
        lea si, content
        mov di, 0
        count:
            mov bl, [si]
            cmp bl, 0
            je exitCount
            sub bl, 20
            mov content[di], bl
            inc di
            inc si
            jmp count
            exitCount:
        
        mov dx, di
        mov len, dl
        
        mov ah, 42h
        mov bx, filetag
        mov dl, 0
        mov cl, 0
        mov al, 0
        int 21h
        
        mov ah, 40h
        mov bx, filetag
        lea dx, content
        mov cl, len
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        int 21h    
        
        mov ah, 4ch
        int 21h
    main endp
end