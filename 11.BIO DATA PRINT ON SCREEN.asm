.model small
.stack 100h
.data
str1 db "NAZEER AHMED KUNBHARA $"
str2 db "SUKKUR IBA UNIVERISTY $"
str3 db "COMPUTER SCIENCE      $"
.code
main proc


mov ax,@data
mov ds,ax

mov ah,09h
lea dx,str1
int 21h


mov ah,02h
mov dl,0dh
int 21h

mov dl,0ah
int 21h

mov ah,09h
lea dx,str2
int 21h

mov ah,02h
mov dl,0dh
int 21h

mov dl,0ah
int 21h

mov ah,09h
lea dx,str3
int 21h

mov ah,4ch
int 21h

main endp
end main