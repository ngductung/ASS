inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    msg1 db "Nhap so n: $"
    msg2 db "Ket qua: $"
    crlf db 10,13,"$"
    n dw ?
    x dw ?
    result dw ?
    tmp dw ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi msg1
        call dec_in 
        mov ax, x
        mov n, ax
        
        call giai_thua
        mov result, ax
        
        inchuoi crlf
        inchuoi msg2
        mov ax, result
        call dec_out
         
        
        mov ah, 4ch
        int 21h
    main endp
    
    dec_in proc
        mov cx, 0
        mov x, cx
        mov bx, 10  
        input:
            mov ah, 01h
            int 21h
            cmp al, 13
            je exit
            mov ah, 0
            sub al, 30h
            mov tmp, ax
            mov ax, x
            mul bx
            add ax, tmp
            mov x, ax
            jmp input
            exit:
            
        ret 
    dec_in endp
    
    giai_thua proc
        mov cx, n
        mov x, cx
        mov ax, 1
        dec cx
        cal:
            push cx
            mov bx, x
            mul bx
            mov dx, x
            dec dx
            mov x, dx 
            pop cx
            loop cal
        ret
    giai_thua endp
    
    dec_out proc
        mov bx, 10
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx 
            cmp ax, 0
            ja chia
        output:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop output
        ret
    dec_out endp
end

; toi da n=8
; Giai thich:
;   Vi emu8086 toi da la 16bit nen gia tri lon nhat la 2^16=65536
;       8! = 40320
;       9! = 362880 > 2^16 => Toi da la n=8