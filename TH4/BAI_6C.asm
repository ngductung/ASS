inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100
.data
    msg1 db "Nhap 1 ky tu: $"
    msg2 db "Ma ASCII o dang Dec: $" 
    msg3 db "Nhap so thu nhat: $"
    msg4 db "Nhap so thu hai: $"
    msg5 db "Tong: $"
    crlf db 10,13,"$"
    kytu db ?
    x db ?   
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        mov ah, 01h
        int 21h
        mov kytu, al
        
        inchuoi crlf
        inchuoi msg2
        mov ax, 0
        mov al, kytu
        call dec_out
        
        inchuoi crlf
        inchuoi msg3
        call dec_in
        mov x, al
        
        inchuoi crlf
        inchuoi msg4
        call dec_in
        add x, al
        
        inchuoi crlf
        inchuoi msg5
        mov ax, 0
        mov al, x
        call dec_out 
        
        mov ah, 4ch
        int 21h
        
        dec_in proc
            mov bx,10
            mov cx, 2           
            mov dh, 0
            ; nhap so hang chuc
            mov ah, 01h
            int 21h
            sub al, 30h
            mul bx ; nhan voi 10
            mov dh, al ; luu tam vao dh
            ; nhap so hang don vi
            mov ah, 01h
            int 21h 
            sub al, 30h
            add al, dh ; cong voi so hang chuc
            ret       
        dec_in endp
        
        dec_out proc
            mov cx, 0
            mov bx, 10
            chia:
                mov dx, 0
                div bx ; lay dx = ax / bx
                push dx ; cat dx vao stack
                inc cx ; tang cx len de dem so lan lap
                cmp ax, 0
                ja chia                          
            inra:
                mov ah, 02h
                pop dx ; lay dx tu trong ngan xap
                add dl, 30h
                int 21h
                loop inra
            ret
        dec_out endp
    endp main
end