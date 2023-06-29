.model small
.stack 100
.data
      mang DB 50 dup(?)  
      kt Db ?
      tb1 db 'Nhap chuoi: $'
      tb2 db 13,10,'So ki tu: $'
      tb3 db 13,10,'Chuoi da nhap vao: $' 
      chia db 10
.code
    main proc
        mov ax,@data
        mov ds,ax  
        
        mov ah,09h 
        lea dx, tb1
        int 21h
        
        ;nhap mang
        lea Si,mang
        mov cx, 0 
nhap:        
        mov ah,01h
        int 21h 
        cmp al,0Dh
        je xuong
        mov [si], al
        inc si
        inc cx
        jmp nhap
;xuong dong        
xuong:  
        lea dx, tb2  
        mov ah,09h
        int 21h
;hien thi so ky tu        
        mov kt,cl
        mov al,cl
        mov ah,0
        mov cx, 0
        
        lap:
            mov dx,0
            div chia
            
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            mov ah,0
            
            cmp ax,0
            jne lap
        display:
            pop dx
            mov ah,2
            int 21h
            loop display
        
        lea dx,tb3  
        mov ah,09h
        int 21h
;hien thi da nhap vao        
        mov cl,kt
        lea si,mang
        xuat:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop xuat  
            
        mov ah,4Ch
        int 21h
    
    main endp
end main