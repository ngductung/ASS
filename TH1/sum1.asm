.model small
.stack 100


.code
    main proc
    
    mov ax, 10
    add ax, 8086
    sub ax, 100h
    add ax, 350
    add ax, 0FAh    
    ;ax = 20F8h = 8440    
        
    main endp
end main

