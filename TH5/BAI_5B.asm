.model small
.data
    string db "ngductung"
    len dw $ - string
    filename db "d:\data.txt",0
    filetag dw ?
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 3ch
        lea dx, filename
        mov cx, 0
        int 21h
        
        mov filetag, ax
        mov ah, 40h
        mov cx, 0
        mov cx, len
        mov bx, filetag
        lea dx, string
        int 21h
        
        mov ah, 3eh
        mov bx, filetag
        int 21h
        
        
        mov ah, 4ch
        int 21h
    main endp

end   

; Giai thuat:
;   Tao tap tin
;   Che do ghi file
;   Gan cx = 0
;   Gan cx = len (do dai cua chuoi can ghi, so byte can ghi)
;   Gan bx = thefile
;   Gan dx la dia chi offset cua vung dem
;       Neu thang cong thi CF=0
;       Neu that bai thi CF=1 va AX=ma loi
;   Dong file
; len db $ - string co y nghia de lay do dai cua chuoi
; xor cx, cx de cx = 0 tuong tu voi mov cx, 0 
; Dung lenh mov cx, len vi len dang la 8 bit
;   dung lenh mov cx, len thi phai doi bien len thanh dw
;   neu khong thay doi thi se co loi, vi cx la 16bit con len la 8bit

