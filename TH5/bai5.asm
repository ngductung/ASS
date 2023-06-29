inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm                         
.model small
.data
    tb db "Nhap ten file: $"
    filename db 250 dup ("$")
    content db 250 dup ("$")
    tmp db 250 dup ("$")
    crlf db 10,13,"$"
    len db ?
    filetag dw ?

.code
    main proc
        mov ax, @data
        mov ds, ax 
        
        inchuoi tb
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
        lea dx, filename       
        mov al, 2
        int 21h
        mov filetag, ax
        
        mov ah, 3fh
        mov bx, filetag
        lea dx, content
        int 21h
        
        lea si, content
        mov di, 0
        count:
            mov bl, [si]
            cmp bl, 'A'
            jae process 
            cmp bl, 36
            je exitCount
            jmp next
            process:
                cmp bl, 'Z'
                jbe process2
                jmp next
            process2:
                add bl, 32
                
            next:         
                mov content[di], bl
                inc si
                inc di
                jmp count
                
            exitCount:
            
        mov dx, di
        mov len, dl    
        
        mov ah, 42h
        mov dx, 0
        mov cx, 0
        mov bx, filetag
        mov al, 0
        int 21h
        
        mov cx, 0
        mov ah, 40h
        lea dx, content
        mov bx, filetag
        mov cl, len
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end