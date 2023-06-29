write macro bien1 
;local bien1
    mov ah, 09h
    lea dx, bien1
    int 21h      
endm

.model small
.stack 100
.data
    tb db "Nhap chuoi ky tu: $"
    s db "*$" 
    inputChar db 250 dup ("$") 
    crlf db 10,13,"$"
    input db ?   
    
.code
    main proc
        mov ax, @data
        write tb
        mov si, 0  
        mov cx, 10
        lap:
            mov ah, 07h
            int 21h       
            cmp al, 27
            je exit
            mov input, al
            mov inputChar[si], al
            inc si 
            write s
            loop lap 
        exit: 
            write crlf
            write inputChar
        
        mov ah, 4ch
        int 21h
    main endp
end
