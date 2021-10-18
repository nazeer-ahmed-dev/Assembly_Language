.model small
.stack 100h
.data
str1 db "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-$"
str2 db "    WELCOME TO HIT THE NUMBER GAME $" 
str3 db "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-$"  
str4 db "ENTER THE NUMBER : $"
str5 db " ---------->>$"
col db ?
row db ?                     
num db "0$"                  
num1 db ?
.code 

main proc   
    
    mov ax,@data
    mov ds,ax
    
    mov ah,02h
    mov dl,20
    mov dh,0
    int 10h
    
    mov ah,09h
    lea dx,str1
    int 21h
   
     
    mov ah,02h
    mov dl,20
    mov dh,1
    int 10h 
    
    mov ah,09h
    lea dx,str2
    int 21h 
    
    
    mov ah,02h
    mov dl,20
    mov dh,2
    int 10h 
    
    mov ah,09h
    lea dx,str3
    int 21h
    
    mov col,60
    mov row,3
    
    mov cx,10
    
    l1:  
    
    mov ah,02h
    mov dl,col
    mov dh,row
    int 10h
    
    mov ah,09h
    lea dx,num
    int 21h
    
    inc row
    inc num
    
    loop l1
    
    mov ah,02h
    mov dl,0
    mov dh,row
    int 10h
    
    mov ah,09h
    lea dx,str4
    int 21h
    
    
    mov ah,01h 
     int 21h
    mov num1,al
   
    
    mov col,0 
              
    sub num1,48
    add num1,3
    mov cx,50
    
    l2:
    
    mov ah,02h
    mov dl,col
    mov dh,num1
    int 10h
    
    mov ah,09h
    lea dx,str5
    int 21h
    
    inc col
    
    loop l2
    
    
mov ah,4ch
int 21h

main endp
end main