write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInput db "Nhap ma sinh vien: $"
    nameSV db "Ho ten: Nguyen Duc Tung$"
    wrong db "Nhap sai MaSV. Nhap lai!!!$ " 
    maSV db "AT170556"
    maSVInput db 12 dup ("$") 
    crlf db 10, 13, "$" 
    tbInputN db "Nhap n: $"
    tbKQ db "Ket qua giai thua: $"
    n dw ?
    tmp dw ? 
    
.code
    main proc
        mov ax, @data
        mov ds, ax 
        mov es, ax
        
        input:
            write tbInput
            mov ah, 0ah
            lea dx, maSVInput
            int 21h
            
            lea si, maSV
            lea di, maSVInput + 2 
            mov cx, 8
            repe cmpsb
            je continute
            write crlf   
            write wrong
            write crlf
            jmp input
        
        continute:
            write crlf
            write nameSV
            write crlf
            write tbInputN
            call n_in    
            call giaiThua
            mov tmp, ax
            write crlf
            write tbKQ
            mov ax, tmp
            call dec_out
            
        exit:
            mov ah, 4ch
            int 21h
    main endp    
    
    n_in proc
        mov cx, 0
        mov n, cx
        mov bx, 10
        input_dec:
            mov ah, 01h
            int 21h
            cmp al, 13
            je exitInput_dec
            mov ah, 0
            sub al, 30h
            mov tmp, ax
            mov ax, n
            mul bx
            add ax, tmp
            mov n, ax
            jmp input_dec
            
            exitInput_dec:
        ret
    n_in endp
    
    giaiThua proc
        mov cx, n
        mov tmp, cx
        mov ax, 1
        dec cx
        cal:
            push cx
            mov bx, tmp
            mul bx
            mov dx, tmp
            dec dx
            mov tmp, dx
            pop cx     
            loop cal
        ret
    giaiThua endp
    
    dec_out proc
        mov bx, 10
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            jne chia
        output:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop output
        ret   
    dec_out endp
end