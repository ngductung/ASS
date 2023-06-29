write macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100
.data
    tb db "Nhap chuoi: $"
    oldpass db "1337133700"
    char db ?
    input db 250 dup("$")
    tbDung db "Ban da nhap dung$"
    tbSai db "Ban da nhap sai! Vui long nhap lai$"
    s db "*$"
    crlf db 10,13,"$"

.code
    main proc
        mov ax, @data
        mov ds, ax 
        mov es, ax 
        lap: 
            mov cx, 10
            write tb 
            mov si, 0
            nhap:
                mov ah, 07h
                int 21h 
                mov char, al
                mov input[si], al
                inc si   
                write s
                loop nhap
            
        cld
        mov cx, 10
        lea si, input
        lea di, oldpass
        repe cmpsb
        je intbDung
        write crlf
        write tbSai
        write crlf
        jmp lap
        intbDung:
            write crlf
            write tbDung
        
        mov ah, 4ch
        int 21h
    main endp
end