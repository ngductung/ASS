DSEG SEGMENT
;    chuoi DB 'Chao sinh vien nganh Cong Nghe Thong Tin.$'
;    chuoi db 'Khoa cong nghe thong tin HVMM. $'
    chuoi db 'kma', 10, 13, 'cntt$'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start: 
    mov ax, DSEG
    mov ds, ax
    
    mov ah, 09h ; Hàm 9, in chuoi ki tu ra màn hinh
    lea dx, chuoi ; dl chua ki tu can in
    int 21h ; goi ngat thuc hien   
    
    mov ah, 08h
    int 21h
    
    ; in ra xuong dong
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; in ra man hinh so 2022 
    xor ax, ax
    mov ax, 2022
    mov bx, 10
    mov cx, 0
    chia:
        mov dx,0
        div bx
        push dx
        inc cx
        cmp al,0
        je xuat
        jmp chia
    xuat:
        pop dx
        mov ah, 2
        add dl, 30h
        int 21h
        loop xuat                  
    
    mov ah, 4ch ; thoat khoi chuong trinh
    int 21h
    
CSEG ENDS
END start                        



; gia tri 10(decimal) la ky tu xuong dong trong ascii
; gia tri 13(decimal) la ky tu tro ve dau dong trong ascii 