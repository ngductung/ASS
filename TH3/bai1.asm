.model small
.stack 100
.data
    tb  db 'Input: $'
    tb1 db 13,10,'Good morning!$'
    tb2 db 13,10,'Good Afternoon!$'
    tb3 db 13,10,'Good Evening!$'
    tb4 db 13,10,'Vui long nhap dung!!!!$'
.code
    main proc
    
    mov ax, @data
    mov ds, ax
    
    ; in thong bao nhap
    mov ah, 09h
    lea dx, tb
    int 21h
    
    ; nhap 1 ky tu
    mov ah, 01h
    int 21h
    
    ; check chu hoa hay chu thuong
    cmp al, 'Z'
    
    jnb convert
    
    jmp check
    
    ; neu la chu thuong thi se -32 de chuyen ve chu hoa
    convert:
        sub al, 32
        
    check:
        ; neu ky tu trong al la 'S' thi in ra thong bao 1
        cmp al, 'S'
        je display_tb1
        
        ; neu ky tu trong al la 'S' thi in ra thong bao 2
        cmp al, 'T'
        je display_tb2
        
        ; neu ky tu trong al la 'S' thi in ra thong bao 3
        cmp al, 'C'
        je display_tb3
    
    ; Neu khong dung cac ky tu 'S','T' hay 'C' thi in ra thong bao loi
    display_er:
        mov ah, 09h
        lea dx, tb4
        int 21h
        mov ah, 4ch
        int 21h
    
    ; In thong bao 1
    display_tb1:
        mov ah, 09h
        lea dx, tb1
        int 21h
        mov ah, 4ch
        int 21h 
    
    ; In thong bao 2
    display_tb2:
        mov ah, 09h
        lea dx, tb2
        int 21h
        mov ah, 4ch
        int 21h  
    
    ; In thong bao 3    
    display_tb3:
        mov ah, 09h
        lea dx, tb3
        int 21h
        mov ah, 4ch
        int 21h
    
    
        
    main endp
end main