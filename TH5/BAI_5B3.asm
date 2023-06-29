inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

.model small
.data
    filename db 250 dup ("$")
    content db 255 dup("$")
    len db ?
    tb db "Nhap ten file: $"
    tb1 db "Nhap noi dung can ghi vao file: $"
    tbS db "Thanh cong!$"
    tbF db "Fail!$" 
    crlf db 10, 13, "$" 
    filetag dw ?
    tmp db 255 dup(?)
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb
        
        mov ah, 0ah
        lea dx, filename
        int 21h
        
        lea si, filename+2 ; si luu dia chi filename
        mov di, 0 ; index
        lap:
            mov bl, [si] ; bl se luu gia tri tai si
            cmp bl, 13   ; neu gia tri cua si hien tai la 13(xuong dong) thi nhay den creatfile
            je creatFile
            mov tmp[di], bl ; luu bl vao tmp (filename tam thoi)
            inc di 
            inc si
            jmp lap
            
        creatFile:
            mov tmp[di], 0
            mov ah, 3ch
            lea dx, tmp
            mov cx, 0
            int 21h  
            
            mov filetag, ax
            
            cmp al, 03
            je error   
            
            inchuoi crlf
            inchuoi tb1
            inchuoi crlf
            mov ah, 0ah
            
            lea dx, content
            int 21h
            
            ; CHUYEN KY TU THUONG THANH HOA
            ; y tuong chuyen ky tu dau moi tu thanh ky tu hoa
            ;   Chuyen ky tu dau tien thanh hoa truoc
            ;   Tiep theo bat dau tu index 3
            ;   Neu no la dau space (20h) thi:
            ;       neu tiep theo no la dau space (20h) thi tang them 1
            ;       con khong se tru 20h de chuyen thanh chu hoa roi tang them 1
            ;   Neu no khong phai la space thi:
            ;       giu nguyen, tang index+1
            ;   Lap den khi nao het chuoi da nhap (gap 13 la ky tu xuong dong)
            
            mov si, 2
            mov bl, content[si]
            sub bl, 20h
            mov content[si], bl
            mov si, 3
               
            lapChuoi:
                mov bl, content[si]
                cmp bl, 13
                je exitString
                cmp bl, 20h
                je convertString
                inc si 
                jmp nextString
                
                convertString:
                    mov bl, content[si+1]
                    cmp bl, 20h
                    je add1
                    sub bl, 20h
                    mov content[si+1], bl
                    add1:
                        
                    inc si
                
                nextString:
                    jmp lapChuoi
                
                exitString:
      
            mov cl, content+1
            mov len, cl
            
            mov ah, 40h
            mov bx, filetag
            mov cl, len
            lea dx, content+2
            int 21h
            
            
            mov ah, 3eh
            mov bx, filetag
            int 21h
            
            inchuoi crlf
            inchuoi tbS
            jmp exit
        
        error:
            inchuoi tbF
            
        exit: 
            mov ah, 4ch
            int 21h
    main endp

end 