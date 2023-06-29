DSEG SEGMENT
    space db ' $'
DSEG ENDS
CSEG SEGMENT 
ASSUME CS: CSEG
start:      
; in ky tu tu a -> z
;    mov dl, 'A' ; DL chua ky tu dau tien la 'A'
;    nhan:
;        mov ah, 02h ; in ky tu trong DL ra man hinh
;        int 21h
;        inc dl ; tang DL len 1 don vi, tuc la ky tu tiep theo
;        cmp dl, 'Z' ; so sanh voi Z
;        jna nhan ; Neu <= 'Z' thi tiep tuc    
;        mov ah, 08h ; Neu > 'Z' thi thoat
;        int 21h

; in ky tu tu z -> a 
;    mov ax, DSEG
;    mov ds, ax
;    mov dl, 'Z'
;    nhan:
;        mov ah,02h
;        int 21h
;        mov cl, dl
;        mov dl, 20h ; space
;        int 21h   
;        mov dl, cl
;        dec dl
;        cmp dl, 'A'
;        jnb nhan
;        mov ah, 08h
;        int 21h    
        
    ; su dung vong lap loop
    mov ax, DSEG
    mov ds, ax 
    mov ax, 0
    mov bl, 'Z'+1
    mov cx,26
    lap:
        mov ah, 02h 
        dec bl
        mov dl, bl
        int 21h
        mov dl, space
        int 21h 
          
        loop lap
    
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start
