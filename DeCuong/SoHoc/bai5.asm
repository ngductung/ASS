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
    wrong db "Nhap sai ma sinh vien. Nhap lai!!!!!"
    hoTen db "Ho ten: Nguyen Duc Tung$"
    crlf db 10,13,"$"   
    tb2 db "Nhap chuoi so: $"
    tb3 db "So duong: $"
    tb4 db "So am: $"
    sumNum dw ?
    end db ?
    duong dw ?
    am dw ?

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
            mov sumNum, si
            mov am, di
            write crlf 
            write tb3
            mov ax, sumNum
            sub ax, am
            mov duong, ax
            call dec_out 
            write crlf 
            write tb4
            mov ax, am
            call dec_out
            
        mov ah, 4ch
        int 21h
            
    main endp
    
    inputString proc
        mov si, 0
        mov di, 0
        inputS:
            mov ah, 01h
            int 21h
            cmp al, 20h
            je check
            cmp al, 13
            je check
            cmp al, 45
            je countNe
            mov end, al
            jmp inputS
            
            countNe:
                inc di
                jmp inputS
            
            check:
                cmp end, 20h
                je inputS     
            
            count:
                inc si
                cmp al, 13
                je exit
                jmp inputS
        
        exit:
            
        ret
    inputString endp 
    
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
        print:
            mov ah, 02h
            pop dx
            add dl, 30h
            int 21h
            loop print
        ret
    dec_out endp
end