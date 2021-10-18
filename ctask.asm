.model small
.stack 100h
.data                   
str1 db " largest value : $"
str2 db " smaller value : $"
.code
main proc
         
    mov ax,@data
    mov ds,ax
    mov cx,5
    l1:
        mov ah,01h
        int 21h
        
        push AX
        
        cmp cx,1
        je b1
        jmp b2
        b1:
            mov bl,al 
            mov bh,al
        b2:
    loop l1 
  
    mov cx,5
    l2:
        pop AX 
        cmp bl,al
        jg k1
        cmp bh,al 
        jl k2
        jmp k3 
       
        k1:
            mov bl,al
        
        k2:
             mov bh,al
        k3:
    loop l2 
    
    mov ah,02h
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h
  
    mov ah,09h
    lea dx,str1
    int 21h
    
    mov ah,02h
    mov dl,bh
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
    mov dl,bl
    int 21h  
    
    
       
mov ah,4ch
int 21h
         
         
main endp
end main