inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
    ENDM
DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 8 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
    xdong DB 10, 13, '$'
    sobin DB ? ;
    kt db ? 
DSEG ENDS
CSEG SEGMENT
ASSUME CS:CSEG, DS:DSEG
begin: MOV AX, DSEG
    MOV DS, AX
    inchuoi msg1
    MOV AH, 01h
    INT 21h
    MOV kt, AL ;  
    inchuoi xdong
    inchuoi msg2 
    MOV BH, kt ; 
    CALL hex_out
    MOV AH, 02h ; 
    MOV DL, 'h'
    INT 21h
    MOV AH, 07h
    INT 21h
    MOV AH, 4Ch ; 
    INT 21h   
hex_out PROC
    MOV CX, 4
    xuat:
        PUSH CX
        MOV CL, 4
        MOV DL, BH
        SHR DL, CL
        CMP DL, 09h
        JA kytu
        ADD DL, 30h ; 
        JMP inra
        kytu:
            ADD DL, 37h ; 
        inra:
            MOV AH, 02h ;
            INT 21h
        SHL BX, CL ;
        POP CX
    LOOP xuat
    RET
hex_out ENDP
CSEG ENDS
END begin


