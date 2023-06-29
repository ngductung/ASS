org 100h
jmp start   ; dinh nghia cac bien
    msg: db "hello!$", 0dh, 0ah, 24h
start:
    mov ah, 09h
    int 21h
    mov ah, 0
    int 16h
ret