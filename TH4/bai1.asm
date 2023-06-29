inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    msg1 db "Nhap so nhi phan A: $"
    msg2 db "Nhap so nhi phan B: $"
    msgc db "A + B = $"
    msgt db "A - B = $"
    msga db "A and B = $"
    msgo db "A or B = $"
    crlf db 10,13,"$"
    x dw ?
    y dw ?
    c dw ?
    t dw ?
    a dw ?
    o dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        call bin_in
        mov x, bx
        
        inchuoi crlf
        inchuoi msg2
        call bin_in
        mov y, bx
        
        ; tinh tong
        inchuoi crlf
        inchuoi msgc
        mov bx, x
        add bx, y
        mov c, bx
        call bin_out 
        
        ; tinh hieu
        inchuoi crlf
        inchuoi msgt
        mov bx, x
        sub bx, y
        mov t, bx
        call bin_out
        
        ; and
        inchuoi crlf
        inchuoi msga
        mov bx, x
        and bx, y
        mov a, bx
        call bin_out
        
        ; or
        inchuoi crlf
        inchuoi msgo
        mov bx, x
        or bx, y
        mov o, bx
        call bin_out
        
        
        mov ah, 4ch
        int 21h
    main endp
    
    bin_in proc
        mov cx, 16
        mov bx, 0
        input:
            push cx
            mov ah, 01h
            int 21h
            sub al, 30h 
            mov cl, 1
            shl bx, cl
            add bl, al           
            pop cx
            loop input
        ret
    bin_in endp
    
    bin_out proc
        mov cx, 16
        output:
            push cx
            mov dl, 0
            shl bx, 1
            rcl dl, 1
            add dl, 30h
            mov ah, 02h
            int 21h 
            
            pop cx
            loop output
        ret
    bin_out endp
end