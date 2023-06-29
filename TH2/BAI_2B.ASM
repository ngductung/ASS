DSEG SEGMENT
    tbao DB 'Hay go vao 1 phim: $'
DSEG ENDS
CSEG SEGMENT    
ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax
    
    ; In thong bao ra man hinh
    mov ah, 09h 
    lea dx, tbao
    int 21h
    
    ;mov ah, 01h ; Ham 1, nhan ky tu tu ban phim  
    mov ah, 07h ; Ham 1, nhan ky tu tu ban phim
    int 21h ; goi ngat thuc hien ham  
    
    mov ah, 4Ch                       
    int 21h
    
CSEG ENDS
END start     
     
; Ky tu vua nhap duoc luu o AL, duoi dang hex 
; Ham 1 va ham 7:
;   + Giong: deu la nhap ky tu
;   + Khac:
;       - Ham 01h: Hien ky tu duoc nhap tren man hinh va luu vao thanh ghi
;       - Ham 07h: Khong hien ky tu vua nhap nhung van luu vao thanh ghi 