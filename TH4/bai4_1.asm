inchuoi MACRO chuoi
    mov AH, 9h
    lea DX, chuoi
    int 21h
    endm
DSEG SEGMENT
    ; nhap so 8 bit
    ; msg1 DB "Hay nhap so nhi phan 8 bit: $" 
    ; nhap so 16 bit
    msg1 DB "Hay nhap so nhi phan 16 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
    xdong DB 10, 13, '$'
    sobin dw ? ; 
DSEG ENDS
CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: 
    mov ax, DSEG
    mov ds, ax
    inchuoi msg1
    call bin_in
    ; nhap so 8 bit
    ; mov sobin, bl
    ; nhap so 16 bit
    mov sobin, bx
    inchuoi xdong
    inchuoi msg2
    ; nhap so 8 bit
    ; mov bl, sobin
    ; nhap so 16 bit
    mov bx, sobin
    call bin_out
    mov ah, 01
    int 21h
    mov ah, 4Ch ; 
    int 21h
bin_in PROC
    mov bx, 0 ;
    ; so 8 bit
    ; mov cx, 8
    ; so 16 bit 
    mov CX, 16 ; 
    nhap:
        mov ah, 01h ; 
        int 21h
        cmp al, 0Dh ; 
        jz exit ;
        ; so 16 bit 
        ; shl bl, 1 ;
        ; so 16 bit 
        shl bx, 1 ; 
        sub al, 30h ; 
        add bl, al ;
        loop nhap
    exit:RET
bin_in ENDP
bin_out PROC
    mov cx, 16 ; 
    xuat:
        mov dl, 0
        ; so 8 bit
        ; shl bl, 1 ;
        ; rcl dl, 1 ;  
        ; so 16 bit
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
