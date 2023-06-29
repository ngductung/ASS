.model small
.stack 100
.data
    a1 dw 15h 
    a2 dw 250
    b1 dw 16
    b2 dw 0AF1h
    c1 dw 300
    c2 dw 400
    d1 dw 1000
    d2 dw 100
    e1 dw 1000
    e2 dw 100h 
    
    ; khong khai bao duoc vi khong ho tro 32bit
    ;f1 dw 3AB45Eh
    ;f2 dw 0A1h
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; cau a       
        mov ax, 0
        mov ax, a1
        mul a2
        ; ax = 1482h = 5250
        
        ; cau b
        mov ax, 0
        mov ax, b1
        mul b2  
        ; ax = AF01h
        
        ; cau c
        mov ax, 0
        mov ax, c1
        mul c2
        ; ax = D4C0h
        
        ; cau d
        mov ax, 0
        mov dx, 0
        mov ax, d1
        div d2 
        ; ax = 000Ah
        
        ; cau e
        mov ax, 0
        mov dx, 0
        mov ax, e1
        ;mov ax,0 
        ;mov ax, e2
        div e2
        ; ax = 0003h, dx = 00e8h
        
        mov ah, 4Ch
        int 21h    
    main endp
end main