write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInpuMaSV db "Nhap ma sinh vien: $"
    inputMaSV db 15 dup ("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"
    wrong db "Nhap sai ma sinh vien. Nhap lai!!!$"
    crlf db 10,13,"$"
    hoTen db "Ho va ten: Nguyen Duc Tung$"
    tbInputString db "Nhap chuoi: $"
    inputString db 255 dup("$")
    tbResult db "Ket qua: $"
    
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        input:
            write tbInpuMaSV
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
            call convert
            write inputString+2
            
        mov ah, 4ch
        int 21h 
    main endp
    
    convert proc
        conv: 
            cmp [si], 36
            je exit
            cmp [si], 65
            jae check 
            inc si
            jmp conv 
            
            check: 
                
                cmp [si], 90
                jbe addS
                inc si
                jmp conv
                
            addS: 
                mov dl, [si]
                add dl, 32
                mov [si], dl
                inc si
                jmp conv
             
        exit:
        ret
    convert endp
end