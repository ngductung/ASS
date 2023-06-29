inchuoi MACRO chuoi
    mov AH, 9h
    lea DX, chuoi
    int 21h
    endm
DSEG SEGMENT
    ; nhap so 8 bit
    msg1 DB "Hay nhap so nhi phan 8 bit: $" 
    msg2 DB "So nhi phan da nhap la: $"
    msg3 db "Nhap vao ky tu: $"
    msg4 db "ASCII ky tu vua nhap: $"
    xdong DB 10, 13, '$'
    sobin db ? ; 
DSEG ENDS
CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: 
    mov ax, DSEG
    mov ds, ax
    inchuoi msg1
    call bin_in
    ; nhap so 8 bit
    mov sobin, bl
    mov bl, sobin
     
    inchuoi xdong
    inchuoi msg2
    call bin_out
    
    
    
    inchuoi xdong
    inchuoi msg3  
    
    ; ascii  
    mov bl, 0
    mov ah, 01h ; 
    int 21h      
    add bl, al
    inchuoi xdong 
    inchuoi msg4  
    call ascii_out
    mov ah, 07h
    int 21h
    mov ah, 4Ch ; 
    int 21h
bin_in PROC
    mov bx, 0 ;
    mov cx, 8     
    nhap:
        mov ah, 01h ; 
        int 21h
        cmp al, 0Dh ; 
        jz exit ;
        shl bx, 1 ; 
        sub al, 30h ; 
        add bl, al ;
        loop nhap
    exit:RET
bin_in ENDP
bin_out PROC
    mov cx, 8 ; 
    xuat:
        mov dl, 0
        shl bl, 1 
        rcl dl, 1   
        add dl, 30h  
        mov ah, 02h  
        int 21h
        loop xuat
    ret
bin_out ENDP

; in chuoi bin cua ky tu nhap vao 
ascii_out PROC
    mov cx, 8 ; 
    xuat1:
        mov dl, 0
        shl bl, 1 ; 
        rcl dl, 1 ; 
        add dl, 30h ; 
        mov ah, 02h ; 
        int 21h
        loop xuat1
    ret
ascii_out ENDP
CSEG ENDS
END begin
