inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    msg1 db "Nhap so hexa A: $"
    msg2 db "Nhap so hexa B: $"
    msgc db "A + B = $"
    msgt db "A - B = $"
    msga db "A and B = $"
    msgo db "A or B = $"
    crlf db 10,13,"$"
    x dw ?
    y dw ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        call hex_in
        mov x, bx
        
        inchuoi crlf
        inchuoi msg2
        call hex_in
        mov y, bx
        
        inchuoi crlf
        inchuoi msgc
        mov bx, x
        add bx, y
        call bin_out
        
        inchuoi crlf
        inchuoi msgt
        mov bx, x
        sub bx, y
        call bin_out
        
        inchuoi crlf
        inchuoi msga
        mov bx, x
        and bx, y
        call bin_out
        
        inchuoi crlf
        inchuoi msgo
        mov bx, x
        or bx, y
        call bin_out
        
        mov ah, 4ch
        int 21h
    main endp
    
    hex_in proc
        mov cx, 4
        mov bx, 0
        input:
            push cx
            shl bx, 4   
            mov ah, 01h
            int 21h
            cmp al, 39h
            ja kytu
            sub al, 30h
            jmp next
            
            kytu:
                sub al, 37h
            next:
            
            add bl, al
            pop cx
            loop input
        ret
    hex_in endp
    
    bin_out proc
        mov cx, 16
        lap:
            push cx
            shl bx, 1
            mov dl, 0
            rcl dl, 1
            add dl, 30h
            mov ah, 02h
            int 21h
            pop cx
            loop lap
        ret
    bin_out endp
end