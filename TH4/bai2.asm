inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h       
endm

.model small
.stack 100
.data
    msg1 db "Nhap ky tu: $"
    msg2 db "Ma ASCII o dang Hex: $"
    msg3 db "Ma ASCII o dang Dec: $"
    msg4 db "Ma ASCII o dang Bin: $"
    crlf db 10,13,"$"
    kytu db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        mov ah, 01h
        int 21h
        mov kytu, al
        
        ; dang hex
        inchuoi crlf
        inchuoi msg2
        mov bh, kytu
        call hex_out
        mov ah, 02h
        mov dl, "h"
        int 21h
        
        ; dang dec
        inchuoi crlf
        inchuoi msg3
        mov ax, 0
        mov al, kytu
        call dec_out
        
        ; dang bin
        inchuoi crlf
        inchuoi msg4
        mov bh, kytu
        call bin_out
        mov dl, 'b'
        mov ah, 02h
        int 21h
        
        
        mov ah, 4ch
        int 21h           
    main endp
    
    hex_out proc
        mov dl, 0
        mov cx, 2 ; 2 vong lap
        output:
            push cx
            mov cl, 4 ; dich 4 bit
            mov dl, bh
            shr dl, cl  ; dich trai 4 bit de lay duoc ky tu dau
            cmp dl, 09h  ; neu la chu thi + 37h, la so thi + 30h
            ja kt
            add dl, 30h
            jmp inra
            
            kt:
                add dl, 37h
            inra:
                mov ah, 02h
                int 21h
            shl bx, cl  ; dich phai 4 bit de vong lap lan sau lay duoc ky tu thu 2
            pop cx
            loop output
        ret
    hex_out endp
    
    dec_out proc
        mov cx, 0
        mov bx, 10
        chia: 
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            ja chia
        inra1:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop inra1
        ret
    dec_out endp
    
    bin_out proc
        mov cx, 8
        lap:
            push cx
            mov dl, 0
            rcl bh, 1
            rcl dl, 1 
            add dl, 30h
            mov ah, 02h
            int 21h
            pop cx
            loop lap
        ret
    bin_out endp
end