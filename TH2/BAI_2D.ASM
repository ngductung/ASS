DSEG SEGMENT
    max DB 61
    len DB 0
    chuoi DB 61 dup("$")
    tbao DB 'Hay go vao 1 chuoi: $'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start: 
    mov ax, DSEG
    mov ds, ax  
    
    ; in thong bao ra man hinh
    mov ah, 09h 
    lea dx, tbao
    int 21h
    
    ; Ham 0ah, nhap chuoi ky tu tu ban phim
    mov ah, 0ah 
    lea dx, MAX ; dx chua dia chi vung dem ban 
    int 21h ; goi ngat thuc hien ham 
    ;mov ah, len
    
    ; tro ve he dieu hanh
    mov ah, 4ch 
    int 21h
CSEG ENDS
END start



; khong nhap duoc nhieu hon 30 ky tu vi khai bao max la 30 ky tu
; gia tri bien len se la do dai cua chuoi nhap vao
; de nhap nhieu hon 30 ky tu thi co the thay doi gia tri cua bien max
; kha nang toi da dua vao so ky tu cua bien 