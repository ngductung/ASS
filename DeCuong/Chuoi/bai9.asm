write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInputMaSV db "Nhap ma sinh vien: $" 
    inputMaSV db 15 dup("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"
    wrong db "Nhap ma sinh vien sai. Nhap lai!!!$"
    crlf db 10,13,"$" 
    hoTen db "Ho va ten: Nguyen Duc Tung$"
    tbInputString db "Nhap chuoi: $"
    inputString db 255 dup ("$") 
    tbResult db "Ket qua: $"
    result db 255 dup ("$")
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        input:
            write tbInputMaSV
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
            write tbInputString
            mov ah, 0ah
            lea dx, inputString
            int 21h     
            write crlf
            write tbResult
            lea si, inputString+2
            call daoNguoc    
               
        mov ah, 4ch
        int 21h
    main endp
    
    daoNguoc proc 
        mov cx, 0
        conv:     
            mov dx, 0
            mov dl, [si]
            cmp dl, 13
            je print 
            inc si
            inc cx 
            push dx 
            jmp conv
            
        print:
            mov ah, 02h
            pop dx
            int 21h
            loop print
            
        exit:
        ret    
    daoNguoc endp
end
    