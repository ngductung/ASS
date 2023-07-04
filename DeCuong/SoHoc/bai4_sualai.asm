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
    crlf db 10, 13, "$"                           
    hoTen db "Ho va ten: Nguyen Duc Tung$" 
    tbInputString db "Nhap vao chuoi so: $" 
    string db 255 dup ("$")
    tbResult db "Cac so chia het la: $"
    fail db "chi nhap cac chu so. Tam biet!!!$"
    result dw ?
    endss dw ?
    x dw ?
    y dw ?
    flag db ?
 
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
            mov result, 0
            call inputString
            cmp cx, 0
            je return
            write crlf
            write tbResult
            mov ax, result
            call dec_out
            
        return:
            mov ah, 4ch
            int 21h
        
    main endp
    
    dec_out proc
        mov bx, 10
        mov cx, 0
        chia:
            mov dx, 0
            div bx
            push dx
            inc cx
            cmp ax, 0
            jmp print
        print:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop print
        ret
        
    dec_out endp
    
    inputString proc
        mov dx, 0
        mov flag, 0
        mov cx, 1
        inputS:
            mov bx, 10
            mov ah, 01h
            int 21h
            mov ah, 0
            mov endss, ax
            cmp al, 13
            je check
            cmp al, 20h
            je check
            cmp al, 48
            jb error
            cmp al, 57
            ja error
                       
               
            mov flag, 1
            sub ax, 30h
            mov y, ax
            mov ax, x
            mul bx
            add ax, y
            mov x, ax
            jmp inputS
            
        check: 
            mov ax, x
            mov bx, 3 ; change this
            div bx
            cmp dx, 0 
            je count
            
            jmp check1
            
        count: 
            cmp flag, 0
            je check1
            inc result 
                check1:
                    cmp endss, 13
                    je exit   
                    mov flag, 0
                    mov x, 0
                    jmp inputS
        
        error:
            write crlf
            write fail
            mov cx, 0     
            
        exit:
        ret        
        
    inputString endp
end
    