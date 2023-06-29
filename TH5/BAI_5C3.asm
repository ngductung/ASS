inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm         
    
endm

.model small
.data
    tb1 db "Nhap ten file copy: $"
    filename db 250 dup ()       
    tb2 db "Nhap ten dia chi patse: $"
    filecopy db 250 dup ()
    tmp db 250 dup("$")
    content db 250 dup("$")
    crlf db 10, 13, "$"
    len dw ?
    filetag dw ?
    success db "THANH CONG!!!$"
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
                   
        ; input filename
        inchuoi tb1
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea si, tmp+2
        mov di, 0
        input1:
            mov bl, [si]
            cmp bl, 13
            je exit1
            mov filename[di], bl
            inc si
            inc di
            jmp input1
            
            exit1:
                mov filename[di], 0
                
        ; open filename
        mov ah, 3dh
        lea dx, filename
        mov al, 0
        int 21h
        mov filetag, ax
        
        ; doc noi dung
        mov ah, 3fh
        mov bx, filetag
        mov cx, 1000
        lea dx, content
        int 21h
        
        ; close filename
        mov ah, 3eh
        mov bx, filetag
        int 21h
                
        ; input filecopy
        inchuoi crlf
        inchuoi tb1
        mov ah, 0ah
        lea dx, tmp
        int 21h 
        
        
        lea si, tmp+2
        mov di, 0
        input2:
            mov bl, [si]
            cmp bl, 13
            je exit2
            mov filecopy[di], bl
            inc si
            inc di
            jmp input2
            
            exit2:
                mov filecopy[di], 0
        
        
        
        ; open filecopy
        mov ah, 3ch
        lea dx, filecopy
        mov cx, 0
        int 21h
        mov filetag, ax
        
        ; get length content
        lea si, content
        mov di, 0
        count:
            mov bl, [si]
            cmp bl, 36
            je exitCount
            inc si
            inc di
            jmp count
            exitCount:
        
        mov len, di
        ; write to filecopy
        mov ah, 40h
        lea dx, content
        mov cx, len
        mov bx, filetag
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        
        inchuoi crlf
        inchuoi success
        mov ah, 4ch
        int 21h
    main endp
end