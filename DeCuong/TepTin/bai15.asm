write macro string
    mov ah, 09h
    lea dx, string
    int 21h
endm

.model small
.stack 100
.data
    tbInputMaSV db "Nhap ma sinh vien: $"
    inputMaSV db 255 dup ("$")
    maSV1 db "AT170556"
    maSV2 db "at170556"
    maSV3 db "At170556"
    maSV4 db "aT170556"                  
    wrong db "Nhap sai ma sinh vien. Nhap lai!!!$"
    hoTen db "Ho va ten: Nguyen Duc Tung$"        
    crlf db 10, 13, "$"      
    oldFile db "e:\test.txt", 0
    tbInputFilename db "Nhap ten file: $"
    filename db 255 dup (?)
    tmp db 255 dup ("$")
    
    
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
            write tbInputFilename
            call inputFilename
            ; rename file
            mov ah, 56h
            lea dx, oldFile ; rename file e:\test.txt
            lea di, filename
            int 21h
        
        mov ah, 4ch
        int 21h
    main endp
    
    inputFilename proc
        mov si, 0
        mov filename[si], "e"
        inc si
        mov filename[si], ":"
        inc si
        mov filename[si], "\"
        inc si
        mov ah, 0ah
        lea dx, tmp
        int 21h
        
        lea di, tmp+2
        lap:
            mov dl, [di]
            cmp dl, 13
            je exit
            mov filename[si], dl
            inc si
            inc di
            jmp lap
        exit:
            mov filename[si], 0
        ret                      
        
    inputFilename endp
   
end
    