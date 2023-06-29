.model small
.stack 100
.data
    filename db "d:\data.txt",0
    filetag dw ?
    buffer db 251 dup ("$")
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 3dh    ; mo file, neu thanh cong => cf=0, ax=thefile
        lea dx, filename
        mov al, 2
        int 21h
        
        mov filetag, ax ; luu the file
        
        mov ah, 3fh     ; doc file
        mov bx, filetag
        lea dx, buffer  ; dia chi offset vung dem
        mov cx, 10000     ; so byte can doc
        int 21h 
        ; => neu thanh cong cf=0, ax=so byte da doc
        ; => neu that bai cf=1, ax=ma loi
        
        mov ah, 3eh   ; dong file
        mov bx, filetag
        int 21h
        
        ; in noi dung
        mov ah, 09h  
        lea dx, buffer
        int 21h 
        
        mov ah, 08h
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end


; Giai thuat:
;   Mo file da ton tai, neu thanh cong => cf=0,ax=the file; neu that bai cf=1,ax=ma loi
;   luu the file vao ax
;   Doc file voi bx la the file, cx la so byte can doc, dx chua dia chi offset vung dem
;   Dong file
;   In lai noi dung ra man hinh

; voi cac thuoc tinh khac co nhung diem giong va khac nhau:
;   0: giong voi chuong trinh mau
;   1: khong in ra noi dung file
;   3: khong ho tro
;   4: khong ho tro

; The vai co vai tro nhu la dinh danh cua tap tin 

; Neu so byte can doc lon hon kich thuoc that thi khong gay ra loi

; Thanh ghi AX co bi thay doi gia tri, cu the:
;       + neu thanh cong CF=0, AX=so byte da doc
;       + neu that bai CF=1, AX=ma loi