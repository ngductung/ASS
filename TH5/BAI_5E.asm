.model small
.data
    oldfile db "d:\tt_asm\solieu.txt", 0
    newfile db "d:\tt_asm\baitap\data.txt", 0
.code
    main proc
        mov ax, @data
        mov ds, ax   
        mov es, ax 
        
        mov ah, 56h 
        lea dx, oldfile
        lea di, newfile
        int 21h
        
        mov ah, 4ch 
        int 21h
    main endp
end
       
; sau khi thay doi thi ket qua nhan duoc tuong tu nhu minh di chuyen file