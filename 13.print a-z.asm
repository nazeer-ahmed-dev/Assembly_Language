.model small
.stack 100h
.code
main proc
  
 mov bl,'a'
 
 mov cx,26
 
 l1:
 mov ah,02h
 mov dl,bl
 int 21h  
 inc bl
 loop l1

mov ah,4ch
int 21h

main endp
end main