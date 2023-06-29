.model small
.stack 100
.data
    tb  db  'Input: $'
    tb1 db  13,10,'Ky tu HOA$'
    tb2 db  13,10,'Ky tu THUONG$'
    tb3 db  13,10,'Ky tu khac$'
.code   
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, tb
        int 21h
        
        mov ah, 01h
        int 21h
        cmp al, 'Z'
        jna hoa
        
        
        thuong:
            cmp al,'z'
            ja khac
            mov ah, 09h
            lea dx, tb2
            int 21h
            mov ah, 4ch
            int 21h
            
            
        hoa:
            cmp al,'A'
            jb khac
            mov ah, 09h
            lea dx, tb1
            int 21h
            mov ah, 4ch
            int 21h
        
        
        khac:
            mov ah, 09h
            lea dx, tb3
            int 21h 
            mov ah, 4ch
            int 21h
        
        
        
        
    main endp


end main