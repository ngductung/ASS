write macro string1
    mov ah, 09h
    lea dx, string1
    int 21h
endm

.model small
.stack 11
.data
    str1 db "Ngac nhien Chua?"
    tb1 db "Co A trong chuoi str1$"
    tb2 db "Khong co ky tu A trong chuoi str1$"
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        cld
        mov cx, 17
        mov al, "B"
        lea di, str1
        repne scasb
        jne intb2
        write tb1
        jmp exit
        
        intb2: 
            write tb2
        
        exit:
            mov ah, 08h
            int 21h
            
        mov ah, 4ch
        int 21h
    main endp
end