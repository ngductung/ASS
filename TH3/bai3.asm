.model small
.stack 100
.data                  
    space    db  13,10,'$'
    tb  db  'Input: $'
    
.code   
    main proc
        mov ax, @data
        mov ds, ax  
        
        mov ah, 09h
        lea dx, tb
        int 21h
        
        mov ah, 01h
        int 21h
        mov cl, al 
        
        mov ah, 09h
        lea dx, space
        int 21h
        
        mov dl, cl
        
        lap:
            mov ah, 02h
            int 21h
            mov dl, 20h
            int 21h
            inc cl
            mov dl, cl
            cmp dl, 'z'
            jna lap
        
      
        mov ah, 4ch
        int 21h
        
    main endp


end main