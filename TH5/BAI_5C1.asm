inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100
.data
    tb1 db  "Nhap ten file: $"
    filename db 250 dup ($)
    tb2 db  "Noi dung cua file: $"
    buffer  db  251 dup("$")
    filetag dw ?
    crlf db 10,13,"$"
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
        
        inchuoi crlf
        inchuoi tb2
        
        mov ah, 3fh 
        mov bx, filetag
        lea dx, buffer
        mov cx, 10000
        int 21h
                     
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        inchuoi buffer
        
        mov ah, 08h
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end