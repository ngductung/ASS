dseg segment
; dseg la doan du lieu
    s db "hello!$" ; khai bao 1 bien s co noi dung la hello
 dseg ends
cseg segment 
; cseg la doan lenh
    assume cs: cseg, ds:dseg
begin:
    mov ax, dseg ; khoi dong dia chi doan du lieu
    mov ds, ax
    mov ah, 09h
    lea dx, s  ; in ra man hinh gia tri cua bien s
    int 21h
    mov ah, 01h ; doi nhap vao 1 ky tu
    int 21h
    mov ah, 4ch ; thoat chuong trinh
    int 21h
cseg ends
    end begin