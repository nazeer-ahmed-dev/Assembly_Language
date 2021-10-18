.model small
.stack 100h
.code
main proc

mov ah,01h
int 21h
mov bl,al

int 21h
mov cl,al

xchg bl,cl

mov ah,02h 
mov dl,bl
int 21h

mov dl,cl
int 21h

mov ah,4ch
int 21h

main endp
end main
