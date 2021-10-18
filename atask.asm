.model small
.stack 100h
.data                           
str1 db " total number of vowel :  $"
str2 db " press enter to exit $"   
num db ?
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
     mov ah,09h
     lea dx,str2
     int 21h 
     
       
     mov ah,02h
     mov dl,0dh
     int 21h
         
     mov dl,0ah
     int 21h
         
    mov bx,0 
    mov num,'0'
    
  b1:
    mov ah,01h
    int 21h
    cmp al,13
    je b2
    
    PUSH AX
    inc bx
    
    jmp b1
          
    b2: 
        sub cx,cx
        mov cx,bx
        l1:
            pop AX
            
            cmp al,'a'
            je b3
            cmp al,'e'
            je b3
            cmp al,'i'
            je b3
            cmp al,'o'
            je b3
            cmp al,'i'
            je b3
            cmp al,'u'
            je b3
            jmp b4
            
            
            b3:
                inc num
            b4: 
                
         loop l1
         
         mov ah,02h
         mov dl,0dh
         int 21h
         
         mov dl,0ah
         int 21h
                   
         mov ah,09h
         lea dx,str1
         int 21h
                  
         mov ah,02h
         mov dl, num
         int 21h
         
         
  
    
    
mov ah,4ch
int 21h

main endp
end main