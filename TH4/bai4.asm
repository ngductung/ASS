inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    msg1 db "Nhap so dec A: $"
    msg2 db "Nhap so dec B: $"
    msgc db "A + B = $"
    msgt db "A - B = $"
    msga db "A and B = $"
    msgo db "A or B = $"
    crlf db 10,13,"$"
    a dw ?
    b dw ?
    x dw ?
    tmp dw ?             
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        call dec_in
        mov ax, x
        mov a, ax
        
        inchuoi crlf
        inchuoi msg2
        call dec_in
        mov ax, x
        mov b, ax  
        
        inchuoi crlf
        inchuoi msgc
        mov bx, a
        add bx, b
        call bin_out
        
        inchuoi crlf
        inchuoi msgt
        mov bx, a
        sub bx, b
        call bin_out
        
        inchuoi crlf
        inchuoi msga
        mov bx, a
        and bx, b
        call bin_out
        
        inchuoi crlf
        inchuoi msgo
        mov bx, a
        or bx, b
        call bin_out
        
        mov ah, 4ch
        int 21h
    main endp  
    
    dec_in proc
        mov bx, 10
        mov dx, 0
        mov x, dx
        input:
            mov ah, 01h
            int 21h
            mov ah, 0
            cmp al, 13 ; user nhan enter
            je exit
            sub al, 30h
            mov tmp, ax
            mov ax, x
            mul bx
            add ax, tmp
            mov x, ax ; x chua so minh nhap
            jmp input
            exit:
 
        ret
    dec_in endp
    
    bin_out proc
        mov cx, 16
        mov dl, 0
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