.model small
.stack 100h
.data
str1 db "ENTER THE CHAR 1 :$"  
str2 db "ENTER THE CHAR 2 :$"
.code                        
main proc                    
  
mov ax,@data
mov ds,ax
         
mov ah,09h
lea dx,str1
int 21h

mov ah,01h
int 21h
mov bl,al

mov ah,02h
mov dl,0dh
int 21h

mov dl,0ah
int 21h

mov ah,09h
lea dx,str1
int 21h
        
mov ah,01h
int 21h
mov cl,al

mov ah,02h
mov dl,0dh
int 21h

mov dl,0ah
int 21h

mov ah,02h
mov dl,bl
int 21h

mov dl,cl
int 21h


mov ah,4ch
int 21h

main endp 
end main