.model small
.stack 100           
.data
    so db 10,0,10 dup($)
    muoi db 10
    tb1 db 'A: $'
    tb2 db 13,10,'B: $'
    tb3 db 13,10,'A/B: $'
    tb4 db 13,10,'A*B: $'
    b1 dw 0
    b2 dw 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, tb1
        int 21h
        
        mov ah, 0Ah
        lea dx, so
        int 21h
        
        mov ah, 09h
        lea dx, tb2 
        int 21h
        
        call processString
        mov b1, dx
        
        mov ah, 0Ah
        lea dx, so
        int 21h
        
        call processString
        mov b2, dx
        
        mov ah, 09h
        lea dx, tb3
        int 21h
        
        mov dx, b1
        mov ax, b2
        
        mov cx, 0
        chia:
            sub dx,ax
            inc cx
            cmp dx,ax
            jae chia 
        
        mov ax,cx 
        Call displayString   
        
        lea dx, tb4
        mov ah, 09h
        int 21h
        
        mov cx, 0
        mov dx, 0 
        mov cx, b2
        nhan:
            add dx, b1
            loop nhan 
                
        mov ax,dx  
        Call displayString 
        
        mov ah,4Ch
        int 21h
    main endp 
    
    displayString PROC 
        mov cx, 0
           chia1:
            mov dx, 0
            div muoi
            
            add ah, 30h
            mov dl, ah
            push dx
            inc cx
            mov ah, 0
            cmp ax, 0
            jne chia1
        display:
            pop dx
            mov ah, 02h 
            int 21h
            loop display
            ret
    displayString ENDP
    
    processString PROC
        mov dx, 0
        mov cx, 0
        lea si, so + 2
        mov cl,[so+1]
        lap:
            mov ax, dx
            mov bx, 0
            mov bl, [si]
            sub bl, 30h
            mul muoi
            add ax, bx
            mov dx, ax
            inc si
            loop lap
            ret
    processString ENDP
end main