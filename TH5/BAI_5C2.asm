inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    tb1 db  "Nhap ten file: $"
    filename db 250 dup ("$")
    tb2 db  "Noi dung cua file: $"
    content  db  251 dup("$")
    tb3 db "File da duoc copy sang: e:\copy.txt $" 
    filecopy db "E:\copy.txt", 0
    filetag dw ?
    crlf db 10,13,"$"
    len dw ?  
    success db "THANH CONG!!!$"
    tmp db 250 dup ()
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov ah, 0ah
        lea dx, filename
        int 21h
        
        lea si, filename+2
        mov di, 0
        lap:
            mov bl, [si]
            cmp bl, 13
            je exit           
            mov tmp[di], bl
            inc si
            inc di
            jmp lap
            
            exit:
                mov tmp[di], 0
        
        openFile:
            mov ah, 3dh
            lea dx, tmp
            mov al, 2
            int 21h
            
            
            
        mov filetag, ax
        mov ah, 3fh
        mov bx, filetag
        mov cx, 10000
        lea dx, content
        int 21h
        
        inchuoi crlf
        inchuoi tb2
        inchuoi content
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        mov ah, 3ch
        lea dx, filecopy
        int 21h
        
        mov filetag, ax
        lea si, content
        mov di, 0
        lap1:
            mov bl, [si]
            cmp bl, 36
            je exit1
            inc di
            inc si
            jmp lap1
            exit1: 
            
        mov len, di
        
        mov ah, 40h
        lea dx, content
        mov cx, len
        mov bx, filetag
        int 21h
        
        inchuoi crlf
        inchuoi tb3
        inchuoi crlf
        inchuoi success        
        
        mov ah, 4ch
        int 21h
    main endp
end