.model small
.stack 100
.data
    A dw 10
    B dw 8086
    C dw 100h
    D dw 350
    E dw 0FAh
    
.code
    main proc
        mov ax, @data
        mov ds, ax
               
        mov ax, 0
        mov ax, A
        add ax, B
        sub ax, C
        add ax, D
        add ax, E
        ; cau a, AX = 340Dh = 13325
        
        mov ah, 4Ch
        int 21h    
    main endp
end main