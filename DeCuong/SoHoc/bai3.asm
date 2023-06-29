write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInput db "Nhap ma sinh vien: $"
    hoTen db "Ho ten: Nguyen Duc Tung$"
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"
    inputMaSV db 15 dup ("$")
    crlf db 10,13,"$" 
    tb2 db "Nhap chuoi: $"
    wrong db "Nhap ma SV sai. Nhap lai!!!$"
    fail db "Chi nhap cac chu so. Tam biet!!!$"
    tb3 db "Co cac chu so nguyen to la: $"
    result dw ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        input:
            write tbInput
            mov ah, 0ah
            lea dx, inputMaSV
            int 21h
            
            mov cx, 8
            lea di, maSV1
            lea si, inputMaSV+2
            repe cmpsb
            je continue
            mov cx, 8
            lea di, maSV2
            lea si, inputMaSV+2
            repe cmpsb
            je continue
            mov cx, 8
            lea di, maSV3
            lea si, inputMaSV+2
            repe cmpsb
            je continue
            mov cx, 8
            lea di, maSV4
            lea si, inputMaSV+2
            repe cmpsb
            je continue
            write crlf
            write wrong
            write crlf 
            jmp input
            
        continue:
            write crlf
            write hoTen 
            write crlf
            write tb2
            call inputString
            cmp ax, 0
            je return
            mov result, dx
            write crlf
            write tb3
            call dec_out
            
        return:
        mov ah, 4ch
        int 21h
    main endp
    
    inputString proc
        mov dx, 0
        inputS:
            mov ah, 01h
            int 21h
            cmp al, 13
            je exitS
            cmp al, 48
            jb wrongS
            cmp al, 57
            ja wrongS
            cmp al, 33h
            je count
            cmp al, 35h
            je count
            cmp al, 37h
            je count
            cmp al, 39h
            je count 
            jmp inputS
            count:
                inc dx
                jmp inputS
             
            
         wrongS:
            write crlf
            write fail
            mov ax, 0
         exitS:
         ret
    inputString endp
    
    dec_out proc
        mov bx, 10
        mov ax, result
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