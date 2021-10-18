.model small
.stack 100h
.code

main proc

mov ah,02h
mov dl,'n'
int 21h

mov dl,0dh
int 21h

mov dl,0ah
int 21h

mov dl,'k'
int 21h

mov ah,4ch
int 21h

main endp 
end main