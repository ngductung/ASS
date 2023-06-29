inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    filename db "d:\tt_asm\solieu.txt"
    len db ?
    tb1 db "Nhap noi dung can ghi vao file: $"
    tbS db "Thanh cong!$"
    tbF db "Fail!$" 
    crlf db 10, 13, "$"
    content db 250 dup("$")
    filetag dw ?
    
.code 
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 3ch
        lea dx, filename
        mov cx, 0
        int 21h  
        mov filetag, ax
        
        cmp al, 03
        je err
        
        mov ah, 0ah
        lea dx, content
        int 21h
        
        mov cl, content+1
        mov len, cl
        mov ah, 40h
        mov bx, filetag
        mov cx, 0
        mov cl, len
        lea dx, content+2
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        inchuoi crlf
        inchuoi tbS
        
        jmp exit
        
        err:
            inchuoi tbF
            
        exit:
            mov ah, 4ch
            int 21h
    main endp 
end
    