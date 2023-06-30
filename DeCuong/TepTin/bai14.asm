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
    wrong db "Nhap sai ma sinh vien: $"
    hoTen db "Ho va ten: Nguyen Duc Tung$"
    crlf db 10,13,"$" 
    filename db "e:\lll.txt",0
    
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
            
            
            ; delete file
            mov ah, 41h
            lea dx, filename
            int 21h 
            mov ah, 41h
            lea dx, filename
            int 21h
        
        mov ah, 4ch
        int 21h
    main endp 
    
end