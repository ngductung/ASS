inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    oldfile db 250 dup ("$")
    newfile db 250 dup ("$")  ]
    tb1 db "Nhap ten file cu: $"
    tb2 db "Nhap ten file moi: $"
    crlf db 10,13,"$"
    tmp db 250 dup ("$")
.code
    main proc
        mov ax, @data
        mov ds, ax   
        mov es, ax  
        
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
            mov oldfile[di], bl
            inc si
            inc di
            jmp lap
            exit:
                mov oldfile[di], 0
                
        inchuoi crlf
        inchuoi tb2
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea si, tmp+2
        mov di, 0
        lap1: 
            mov bl, [si]
            cmp bl, 13
            je exit1
            mov newfile[di], bl
            inc si
            inc di
            jmp lap1
            exit1:
                mov newfile[di], 0
        
        mov ah, 56h 
        lea dx, oldfile
        lea di, newfile
        int 21h
        
        mov ah, 4ch 
        int 21h
    main endp
end
       