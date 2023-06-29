write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInputName db "Nhap ma sinh vien: $"
    inputMaSV db 15 dup ("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "aT170556"
    maSV4 db "At170556"
    hoTen db "Ho va ten: Nguyen Duc Tung$"
    crlf db 10,13,"$"
    wrong db "Nhap ma sinh vien sai. Nhap lai!!!$"
    tbInputDec db "Nhap so he thap phan: $"
    n dw ?
    tmp dw ?
    tbBin db "Dang thap phan: $"
    tbHex db "Dang Hexa: $" 

.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        input:
            write tbInputName
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
            write tbInputDec
            call dec_in
            write crlf
            write tbBin
            mov bx, n
            call bin_out
            
            write crlf
            write tbHex
            mov bx, n
            call hex_out    
        
        mov ah, 4ch
        int 21h
    main endp 
    
    dec_in proc
        mov bx, 10
        mov cx, 0 
        mov n, cx 
        inputDec:
            mov ah, 01h
            int 21h
            cmp al, 13
            je exitDec
            mov ah, 0
            sub al, 30h
            mov tmp, ax
            mov ax, n
            mul bx
            add ax, tmp 
            mov n, ax
            jmp inputDec
            
        exitDec:
        ret
    dec_in endp
    
    bin_out proc
        mov cx, 16
        printBin:
            mov dl, 0
            shl bx, 1
            rcl dx, 1
            add dl, 30h
            mov ah, 02h
            int 21h
            loop printBin
        ret        
    bin_out endp
    
    hex_out proc
        mov cx, 4
        loopHex:
            push cx
            mov dl, bh
            shr dl, 4
            cmp dl, 09h
            ja kytu
            add dl, 30h
            jmp printHex
            
            kytu:
                add dl, 37h
                
            printHex:
                mov ah, 02h
                int 21h
                
            shl bx, 4           
            pop cx
            loop loopHex
        ret   
    hex_out endp
end