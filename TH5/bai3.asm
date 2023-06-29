inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    tb1 db "Nhap ten file: $"
    tb2 db "Nhap noi dung can chen: $" 
    filename db 250 dup("$")
    content db 250 dup("$")
    tmp db 250 dup ("$")
    tmp2 db 250 dup ("$")
    crlf db 10,13,"$"
    len db ?
    len2 db ?
    filetag dw ?
    
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
            inc si
            inc di
            jmp lap
            exit:
                mov filename[di], 0
        
        mov ah, 3dh
        lea dx, filename
        mov al, 2
        int 21h  
        mov filetag, ax
        
        mov ah, 3fh
        lea dx, content
        mov cx, 250
        mov bx, filetag
        int 21h
        
        lea si, content
        mov di, 0
        count:  
            mov bl, [si]
            cmp bl, 36
            je exitCount
            inc di
            inc si
            jmp count
            exitCount:

        
        mov bx, di
        mov len, bl
        
        mov ah, 42h
        mov al, 0
        mov dx, 0
        mov cx, 0
        mov bx, filetag
        int 21h
        
        inchuoi crlf
        inchuoi tb2
        mov ah, 0ah
        lea dx, tmp2
        int 21h
        
        mov cx, 0
        mov ah, 40h
        mov bx, filetag
        mov cl, tmp2+1
        lea dx, tmp2+2
        int 21h 
        
        mov cx, 0
        mov ah, 40h
        mov bx, filetag
        mov cl, len
        lea dx, content
        int 21h
       
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end