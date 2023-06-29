inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm        

.model small
.data
    tb1 db "Nhap ten file dau tien: $"
    tb2 db "Nhap ten file thu hai: $"
    tb3 db "Noi dung moi duoc luu o e:\copy.txt$"
    filename1 db 250 dup ("$")
    filename2 db 250 dup ("$")
    filename3 db "e:\copy.txt", 0
    content1 db 250 dup ("$")
    content2 db 250 dup ("$")
    tmp db 250 dup ("$")
    crlf db 10,13,"$"
    len1 db ?
    len2 db ?
    filetag1 dw ?
    filetag2 dw ?
    filetag3 dw ?
    
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
            mov filename1[di], bl
            inc di
            inc si
            jmp lap
            exit:
                mov filename1[di], 0
            
        mov ah, 3dh
        lea dx, filename1       
        mov al, 2
        int 21h
        mov filetag1, ax
        
        mov ah, 3fh
        mov bx, filetag1
        lea dx, content1
        int 21h
                     
        lea si, content1
        mov di, 0
        call countLen
        mov dx, di
        mov len1, dl
        
        mov ah, 3eh
        mov bx, filetag1
        int 21h
        
        inchuoi crlf
        inchuoi tb2
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea si, tmp+2
        mov di, 0
        
        lap2:
            mov bl, [si]
            cmp bl, 13
            je exit2
            mov filename2[di], bl
            inc di
            inc si
            jmp lap2
            exit2:
                mov filename2[di], 0
            
        mov ah, 3dh
        lea dx, filename2       
        mov al, 2
        int 21h
        mov filetag2, ax
        
        mov ah, 3fh
        mov bx, filetag2
        lea dx, content2
        int 21h
        
        lea si, content2
        mov di, 0
        call countLen
        mov dx, di
        mov len2, dl
        
        mov ah, 3eh
        mov bx, filetag2
        int 21h     
        
        inchuoi crlf
        inchuoi tb3
        mov ah, 41h
        lea dx, filename3
        int 21h
        mov ah, 41h
        lea dx, filename3
        int 21h
        
        mov ah, 3ch
        lea dx, filename3
        mov cx, 0
        int 21h
        mov filetag3, ax
        
        mov cx, 0
        mov ah, 40h
        lea dx, content1
        mov cl, len1
        mov bx, filetag3
        int 21h
        
        mov ah, 40h
        lea dx, content2
        mov cl, len2
        mov bx, filetag3
        int 21h
        
        mov ah, 3eh
        mov bx, filetag3
        int 21h
        
        
        mov ah, 4ch
        int 21h
    main endp
    
    countLen proc
        count:
            mov bl, [si]
            cmp bl, 36
            je exitCount
            inc si
            inc di
            jmp count
            exitCount:
                      
        ret
    countLen endp
end