.model small
.stack 100
.data
    filename db "e:\aaa.txt", 0

.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 41h
        lea dx, filename
        int 21h
         
        mov ah, 41h
        lea dx, filename
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end
  