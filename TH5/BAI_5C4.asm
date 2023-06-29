inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data           
    tb1 db "Nhap file: $"
    tb2 db "Noi dung cu: $"
    tb3 db "Nhap chuoi: $"
    final db "THANH CONG!!!$"
    crlf db 10,13,"$"
    filename db 240 dup("$")
    tmp db 240 dup("$") 
    tmp2 db 240 dup("$")
    content db 240 dup("$")
    str db 240 dup ("$")
    filetag dw ?
    len db ?    
    len1 db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        ;inchuoi tmp+2
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
        mov cx, 240
        int 21h        
        
        inchuoi crlf
        inchuoi tb2
        inchuoi content
        lea si, content
        mov di, 0
        count:
            mov bl, [si]
            cmp bl, 36
            je exit1
            inc si
            inc di
            jmp count
            exit1:
            
        mov bx, di
        mov len, bl
        
        mov dx, 0
        mov ah, 42h
        mov bx, filetag
        mov dl, 0
        mov cl, 0
        mov al, 2
        int 21h
        
        inchuoi crlf
        inchuoi tb3
        mov ah, 0ah
        lea dx, tmp2
        int 21h
        
        
        mov cl, tmp2+1
        mov len, cl
        
        mov ah, 40h
        mov bx, filetag
        mov cl, len
        lea dx, tmp2+2
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        
        inchuoi crlf
        inchuoi final
        mov ah, 08h
        int 21h 
                
        mov ah, 4ch
        int 21h
    main endp
end