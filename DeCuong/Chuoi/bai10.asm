write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm       

.model small
.stack 100
.data
    tbInputMaSV db "Nhap ma sinh vien: $"
    inputMaSV db 15 dup ("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"
    wrong db "Nhap sai ma sinh vien. Nhap lai!!!$"
    hoTen db "Ho ten: Nguyen Duc Tung$"
    crlf db 10,13,"$"
    tbInputString db "Nhap chuoi: $" 
    tbInputChar db "Nhap ky tu: $"
    inputChar db ?
    inputString db 255 dup ("$")  
    tbResult db "Co xuat hien. Xuat hien so lan la: $"
    tbResult1 db "Khong xuat hien$"
    result dw ?
    
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
            
            lea di, maSV1
            lea si, inputMaSV+2
            mov cx, 8
            repe cmpsb
            je continue
            lea di, maSV2
            lea si, inputMaSV+2
            mov cx, 8
            repe cmpsb
            je continue
            lea di, maSV3
            lea si, inputMaSV+2
            mov cx, 8
            repe cmpsb
            je continue
            lea di, maSV4
            lea si, inputMaSV+2
            mov cx, 8
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
            write tbInputChar
            mov ah, 01h
            int 21h
            mov inputChar, al 
            lea si, inputString+2
            call count
            mov result, di
            mov dx, result
            cmp dx, 0
            je notFound
            write crlf
            write tbResult
            mov ax, result
            call dec_out
            jmp return
        
        notFound:
            write crlf
            write tbResult1
            
        return:
            mov ax, 4ch
            int 21h
    main endp
    
    count proc
        mov di, 0
        lap:       
            mov dl, [si]
            cmp dl, 13
            je exit
            cmp dl, inputChar
            je dem
            inc si
            jmp lap
            
        dem:
            inc di 
            inc si
            jmp lap
            
        exit:
        ret     
    count endp 
    
    dec_out proc
        mov bx, 10
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp al, 0
            ja chia
        print:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop print
            
        ret           
    dec_out endp
end
    