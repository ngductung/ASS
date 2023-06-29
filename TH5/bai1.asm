inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100
.data
    tb1 db "Nhap ten file can xoa: $"
    filename db 250 dup ("$")
    tmp db 250 dup ("$")
    tb2 db "Thanh cong!!!"

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
            inc di
            inc si
            jmp lap
            exit:
                mov filename[di], 0
                
        mov ah, 41h
        lea dx, filename
        int 21h
        mov ah, 41h
        lea dx, filename
        int 21h
        
        inchuoi tb2       
        
        mov ah, 4ch
        int 21h
    main endp
end