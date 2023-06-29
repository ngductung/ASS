; cau truc truong trinh
CSEG SEGMENT
ASSUME CS: CSEG
start: 
    ; bat dau doan code    
    
    ; in ra ky tu B
    mov ah, 02h ; Ham 2, in 1 ky tu ra man hinh
    mov dl, 'B' ; DL chua ky tu ma minh can in 
    int 21h ; goi ngat de thuc hien ham
    mov ah, 08h ; ham 08h, ngat 21
    int 21h
    
    
    ; in ra dau xuong dong
    mov ah, 02h
    mov dl, 13
    int 21h
    mov ah, 02h
    mov dl, 10
    int 21h  
    
    
    ; in ra so 9
    mov dl, 9 ; Ham 2, in 1 ky tu ra man hinh
    add dl, 30h ; DL chua ky tu ma minh can 
    mov ah, 02h ; ham 08h, ngat 21
    int 21h
    
    
    ; in ra dau xuong dong
    mov ah, 02h
    mov dl, 13
    int 21h
    mov ah, 02h
    mov dl, 10
    int 21h
    
    
    ; doan in ra so 89
    mov ax, 0 
    mov bx, 10
    mov ax, 89
    mov cx, 0
    
    divv:
        mov dx,0
        div bx
        push dx
        inc cx
        cmp al,0
        je display
        jmp divv
    display:
        pop dx
        mov ah, 2
        add dl, 30h
        int 21h
        loop display
     
    mov ah, 4Ch ; thoat chuong trinh
    int 21h 
    ; phan ket thuc
CSEG ENDS
END start
                         
                         
; Dong lenh in ra chu 'B' la 3, 4 va 5       
; Dong 6 va 7 la tam dung chuong trinh doi su kien tu ban phim de tiep tuc
; Neu khong co dong 6,7 thi chuong trinh se khong dung lai ma chay tu dau den cuoi luon