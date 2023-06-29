writeln macro bien1 
;local bien1
    mov ah, 09h
    lea dx, bien1
    int 21h 
    
    mov ah, 02h
    mov dl, 0ah
    int 21h
    
    mov dl, 0dh
    int 21h
endm

.model small
.stack 100
.data
    tb db "Chuong trinh so sanh oldpass va newpass$"
    tb1 db "Hai pass giong nhau$"
    tb2 db "Hai pass khac nhau$"
    oldpass db "1234567890"
    newpass db "1234567810"   
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        writeln tb  
        cld; chon chieu xu ly chuoi
        mov cx, 10 ; so ky tu/so byte minh mang di so sanh
        lea si, oldpass ; dia chi chuoi nguon
        lea di, newpass ; dia chi chuoi dich
        repe cmpsb ; so sanh tung ky tu/byte
        je intb1
        writeln tb2
        jmp exit
        intb1:
            writeln tb1
        
        exit:
            mov ah, 08h
            int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end


; doan co chuc nang xuong dong la mov ah, 02h, mov dl, 0ah, int 21h       
; local co chuc nang khai bao 1 bien noi bo ten la bien1, bien1 nay chi co tac dung trong doan macro nay
; dia chi ds va es la giong nhau,    
; repe la lap lai khi bang nhau, co the thay the bang repz (lap khi zf=0)
