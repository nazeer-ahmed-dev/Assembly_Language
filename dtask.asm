.model small
.stack 100h
.data
str1 db "CHAR IS FOUND $"
str2 db "CHAR IS NOT FOUND $" 
str3 db "ENTER A CHAR $"

.code
main proc

   mov ax,@data
   mov ds,ax
      
   mov cx,5
   l1:
    mov ah,01h
    int 21h
    
    push AX
    loop l1
   
    mov ah,02h
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h
    
    mov ah,09h
    lea dx,str3
    int 21h
   
    
    mov ah,01h
    int 21h
    mov bl,al
    
    mov cx,5
    l2:
       pop AX
       
       cmp bl,al
       je b1   
       cmp cx,1
       je b2
       jmp b3
       
       b1:   
            mov ah,02h
            mov dl,0dh
            int 21h
    
            mov dl,0ah
            int 21h
    
            
            mov ah,09h
            lea dx,str1
            int 21h   
            jmp exit
       b2:     
            mov ah,02h
            mov dl,0dh
            int 21h
    
            mov dl,0ah
            int 21h
            
            mov ah,09h
            lea dx,str2
            int 21h   
      b3:
            
    loop l2    
        
exit:
mov ah,4ch
int 21h

main endp 
end main