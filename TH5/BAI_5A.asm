.model small
.stack 100
.data
    filename dw "..\..\test_ass\data.txt",0
    filetag dw ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 3ch ; tao tap tin
        lea dx, filename
        mov cx, 00h
        int 21h
        
;        mov filetag, ax ; cat filetag
;        mov ah, 3eh ; dong file
;        mov bx, filetag
        mov bx, ax
        int 21h
        
        mov ah, 4ch
        int 21h
        
    main endp 
    
end       


; khong su dung ham 08h vi khong can doi nguoi dung xem noi dung tren terminal va doi nguoi dung nhap vao 1 ky tu gi do 
; Trong truong hop khong su dung file de doc, ghi, xoa cac thu thi khong can cat the file,
;    + Neu xu ly nhieu file ma khong luu the file, chuong trinh se khong biet xu ly file nao
; Trong doan nay khong can dong file cung duoc, vi khi ket thuc truong trinh file se tu dong
; Co the bo bien filetag trong chuong trinh nay, khi do co the doi mov bx, ax vi khi tao thanh cong thi ax se luu the file 

