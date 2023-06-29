.model small                                                                                                    .model small
.stack 100
.data
    so db 10,0, 10 dup($)
    muoi dw 10 
    xuong db 13,10,'Ket qua: $'
    b1 dw 0 
    b2 dw 0
    tb1 db 'Nhap so thu nhat: $'
    tb2 db 13,10,'Nhap so thu hai: $'
.code
    main proc
        mov ax, @data
        mov ds, ax 
        
        ;nhap xau
        lea dx, tb1 
        mov ah, 09h
        int 21h  
        
        mov cx, 0
        lea dx, so
        mov ah, 0Ah
        int 21h
        call processString
        mov b1, dx
        
        ;xuong hang  
        mov ah, 09h
        lea dx, tb2
        int 21h
        
        
        mov ah, 0Ah
        lea dx, so
        int 21h
          
        mov ah, 09h
        lea dx, xuong
        int 21h
        
        call processString
        mov b2, dx  
        
        ;cong b1 va b2 vao dx
        mov dx, b2
        add dx, b1
        
        mov ax, dx
        mov cx, 0
        chia:
            mov dx,0
            div muoi
            add dx, 30h
            push dx
            inc cx  
            
            cmp ax, 0
            jne chia
        display:
            pop dx
            mov ah,2 
            int 21h
            loop display
            
        mov ah,4Ch
        int 21h                                
        
    main endp 
    
     processString PROC
        mov dx, 0
        mov cx, 0
        lea si, so + 2
        mov cl, [so+1]
        Lap:
            mov ax,dx
            mov bx,0
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov dx,ax
            inc si
            loop Lap
            ret
    processString ENDP
     
end main