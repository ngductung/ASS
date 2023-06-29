inchuoi MACRO chuoi
    mov AH, 9h
    lea DX, chuoi
    int 21h
endm
DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 16 bit: $"
    msg2 DB "So nhi phan da nhap la: $" 
    xdong DB 10, 13, '$'
    sobin dw ? 
DSEG ENDS     

CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: 
    mov ax, DSEG
    mov ds, ax
    inchuoi msg1  
    call bin_in 
    mov sobin, bx
    inchuoi xdong
    inchuoi msg2  
    mov bx, sobin
    call bin_out
    mov ah, 4Ch ; 
    int 21h
bin_in PROC
    mov bx, 0  
    mov CX, 16  
    nhap:
        mov ah, 01h  
        int 21h
        cmp al, 0Dh  
        jz exit ;
        shl bx, 1 ; 
        sub al, 30h  
        add bl, al ;
        loop nhap
    exit:RET
bin_in ENDP
bin_out PROC
    mov cx, 16 ; 
    xuat:
        mov dl, 0
        shl bx, 1 ; 
        rcl dx, 1 ; 
        add dl, 30h ; 
        mov ah, 02h ; 
        int 21h
        loop xuat
    ret
bin_out ENDP
CSEG ENDS
END begin