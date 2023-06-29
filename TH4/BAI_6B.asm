inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    msg1 db "Nhap 1 ky tu: $"
    msg2 db "Ky tu da nhap o dang hex la: $"  
    msg3 db "Nhap so thu nhat: $"
    msg4 db "Nhap so thu hai: $"
    msg5 db "Tong 2 so la: $"
    crlf db 10,13,"$"        
    sum db ?
    kytu db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; nhap ky tu
        inchuoi msg1
        mov ah, 01h
        int 21h
        mov kytu, al
        
        ; output
        inchuoi crlf
        inchuoi msg2
        mov bh, kytu
        call hex_out
        
        mov ah, 02h
        mov dl, "h"
        int 21h
        inchuoi crlf
        
        ; nhap so thu nhat
        inchuoi msg3
        call hex_in
        mov sum, bh
        inchuoi crlf
        
        ; nhap so thu hai
        inchuoi msg4
        call hex_in
        add sum, bh
        inchuoi crlf
        
        ; in ra tong
        mov bh, sum
        inchuoi msg5
        call sum_out
        mov ah, 02h
        mov dl, "h"
        int 21h
        
        
        mov ah, 4ch
        int 21h
        
        hex_in proc
            mov bh, 0
            mov cx, 2
            ; 2 lan lap
            input:
                push cx
                mov cl, 4
                shl bh, cl
                ; nhap 
                mov ah, 01h
                int 21h
                ; neu ky tu vua nhap la so thi tru di 30h va cong vao bh
                ; neu ky tu vua nhap la chu thi tru di 37h va cong vao bh
                cmp al, 39h
                ja kt1
                sub al, 30h
                add bh, al
                jmp next
            kt1: 
                sub al, 37h
                add bh, al
            next:
            
                pop cx
                loop input
            ret 
        hex_in endp
        
        sum_out proc
            mov cx, 2
            ; lap 2 lan
            xuat1:
                push cx   
                mov cl, 4
                mov dl, bh
                shr dl, cl ; dich sang trai 4 bit
                ; neu dl la so thi cong 30h roi in ra
                ; neu dl la chu thi cong 37h roi in ra
                cmp dl, 09h
                ja kt2
                add dl, 30h
                jmp inra1
                kt2:
                    add dl, 37h
                inra1:
                    mov ah, 02h
                    int 21h
                
                shl bx, cl ; dich phai 4 bit, 4 bit nay vua duoc in ra o tren
                pop cx
                loop xuat1
            ret
        sum_out endp
    
        hex_out proc
            mov cx, 4
            xuat:
                push cx
                mov cl, 4 
                mov dl, bh
                shr dl, cl
                cmp dl, 09h
                ja kt
                add dl, 30h
                jmp inra
            kt: 
                add dl, 37h
            inra: 
                mov ah, 02h
                int 21h
            shl bx, cl
            pop cx
            loop xuat
            ret
        hex_out endp
     endp main
end 