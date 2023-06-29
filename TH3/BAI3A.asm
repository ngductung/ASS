DSEG SEGMENT
    tbao1 DB 13,10,"Ky tu HOA.$"
    tbao2 DB 13,10,"Ky tu thuong.$" 
    tbao1jna DB 13,10,"Ky tu thuong.$"
    tbao2jna DB 13,10,"Ky tu HOA.$"
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax  
    
    mov ah, 01h 
    int 21h 
    
    ; trong ascii table, Z co gia tri la 90
    ; neu gia tri trong AL - 'Z' > 0 => CF = 0, ZF = 0 => ky tu thuong
    ; neu gia tri trong AL - 'Z' < 0 => CF = 1, ZF = 0 => Ky tu hoa
    ; neu gia tri trong AL - 'Z' = 0 => CF = 0, ZF = 1 => ky tu la 'Z'
    cmp al,'Z' 
    
    ; ja chi nhay khi CF=0 va ZF=0 ma CF=0 va ZF=0 khi no la ky tu thuong
    jna nhan
     
    jmp exit
    
    nhan: 
    
    ; khi su dung nhay ja
    ; mov ah, 09 ; in "Ky tu thuong"
    ; lea dx, tbao2jna
    ; int 21h 
    ; mov ah, 4Ch ; tro ve he dieu hanh
    ; int 21h    
    
    ; khi su dung nhay jna  
    mov ah, 09 ; in "Ky tu Hoa"
    lea dx, tbao2jna
    int 21h 
    mov ah, 4Ch ; tro ve he dieu hanh
    int 21h 
 
    exit:
    ; khi su dung nhay ja
    ; mov ah, 9
    ; lea dx, tbao1  ; in "Ky tu hoa"
    ; int 21h      
    
    ; khi su dung jna
    mov ah, 9
    lea dx, tbao1jna  ; in "Ky tu hoa"
    int 21h
    
    mov ah, 4Ch ; tro ve he dieu hanh
    int 21h
CSEG ENDS
END start


; neu khong co jmp exit se luon in ra thong bao ky tu thuong vi chuong trinh se chay tu tren xuong duoi
; Ky tu nhap vao khong phai la chu cai thi phai dua vao gia tri decimal de xac dinh
;   - Neu no co gia tri nho hon 90 => Se in ra la Ky tu hoa
;   - Neu no co gia tri lon hon 90 => Se in ra la Ky tu thuong