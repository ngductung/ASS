write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tb1 db "Nhap ma sinh vien: $"
    inputMaSV db 15 dup ("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"
    crlf db 10,13,"$" 
    wrong db "Nhap sai ma sinh vien. Nhap lai!!!$"
    inputString db 255 dup ("$")
    tb2 db "Nhap chuoi so: $"
    fail db "Nhap sai(vi khong phai la so). Tam biet :))) $" 
    tb3 db "Ket qua cua day so la: $"
    sum dw ? 
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        input:
            write tb1
            mov ah, 0ah
            lea dx, inputMaSV
            int 21h
            
            mov cx, 8
            lea di, maSV1
            lea si, inputMaSV+2
            repe cmpsb
            je continute
            mov cx, 8
            lea di, maSV2
            lea si, inputMaSV+2
            repe cmpsb
            je continute
            mov cx, 8
            lea di, maSV3
            lea si, inputMaSV+2
            repe cmpsb
            je continute
            mov cx, 8
            lea di, maSV4
            lea si, inputMaSV+2
            repe cmpsb
            je continute
            write crlf
            write wrong
            write crlf
            jmp input
            
            
        continute: 
            write crlf
            write tb2 
            mov sum, 0
            call inputNumber
            cmp ax, 0
            je return
            write crlf
            write tb3 
            call dec_out
        return:    
        mov ah, 4ch
        int 21h
    main endp 
    
    inputNumber proc
        inputNum:
            mov ah, 01h
            int 21h
            cmp al, 13
            je exitInput
            cmp al, 48
            jb exitNotNumber
            cmp al, 57
            ja exitNotNumber
            mov ah, 0
            sub al, 30h
            add ax, sum
            mov sum, ax
            jmp inputNum
 
            exitNotNumber:
                write crlf
                write fail
                mov ax, 0 
                
            exitInput:    
        ret
    inputNumber endp
    
    dec_out proc
        mov bx, 10
        mov ax, sum
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            jne chia
        print:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop print
        ret
    dec_out endp
end