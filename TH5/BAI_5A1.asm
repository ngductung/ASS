inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100
.data
    tb1 db "Nhap filename: $"
    tb2 db "Path: vdrive\$"
    crlf db 10,13,"$"
    filename db 250 dup(?)
    filetag dw ?
    max db 200
    len db ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        
        mov si, 0
        
        mov filename[si], 'e'
        inc si
        mov filename[si], ':'
        inc si
        mov filename[si], '\'
        inc si
        
        
        inputName:
            mov ah, 01h
            int 21h
            
            cmp al, 13
            je createFile
            
            mov filename[si], al
            inc si
            jmp inputName
        
            
        createFile: 
        inc si
        mov filename[si], 0
            mov ah, 3ch
            lea dx, filename
            mov cx, 0
            int 21h
            mov filetag, ax
        
        inchuoi crlf
        inchuoi tb2
        mov cx, si
        mov si, 0
        lap:     
            mov ah, 02h
            mov dl, filename[si]
            int 21h
            inc si
            loop lap
            
        
        
        mov ah, 3eh
        mov bx, filetag
        int 21h     
        
        mov ah, 4ch
        int 21h
    main endp 
    
end       
