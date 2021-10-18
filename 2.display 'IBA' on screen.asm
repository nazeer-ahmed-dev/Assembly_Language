.model small
.stack 100h
.code
main proc

mov ah,02h
mov dl,'i'
int 21h

mov dl,'b'
int 21h

mov dl,'a'
int 21h

mov ah,4ch
int 21h

main endp
end main