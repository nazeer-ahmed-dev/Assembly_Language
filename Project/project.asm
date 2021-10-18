.model small
.stack 100h
.data  
a db "******************************************$";
b db "*     WELCOME TO PARKING SYSTEM          *$";
c db "*    By : Sadia Bibi & Nazeer Ahmed       *$";   
user db "User Name : $"
paswd db "Password  : $" 
usr db 10 dup("$")    ; it store 10 char
pswd db 10 dup("$")   ; it store 10 char  
user1 db "Nazeer$"
user2 db "Sadia$"
paswd1 db "123$" 
incorrect_usr_paswd db "You entered wrong user name / password $"
againInput db " press 'enter' to input again user name & password$"  
fortest db "0$"

m1 db "************************************************$";
m2 db "* Arrival of car (PRESS 1)                     *&";

.code
main proc
        
       mov ax,@data
       mov ds,ax
      
       mov ah,02h  
       mov dl,20    ; column position
       mov dh,0     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt
       
       mov ah,09h   
       lea dx,a     ; display a string
       int 21h 
       
       mov ah,02h
       mov dl,0dh   ;carraige reutrn
       int 21h
       
       mov dl,0ah   ; line fied
       int 21h
       
       mov ah,02h
       mov dl,20    ; column position
       mov dh,1     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt
       
       mov ah,09h
       lea dx,b     ; display a string
       int 21h         
       
       
       mov ah,02h
       mov dl,0dh   ; carriage return
       int 21h
       
       mov dl,0ah   ; line fied
       int 21h 
       
       mov ah,02h
       mov dl,20     ; column position
       mov dh,2      ; row position
       mov bx,0      ;set page
       int 10h       ;vedio inturppt
       
       mov ah,09h
       lea dx,c      ;display a string
       int 21h   
       
       mov ah,02h
       mov dl,0dh    ;carriage return
       int 21h
       
       mov dl,0ah    ; line fied
       int 21h
        
        mov ah,02h
       mov dl,20     ;column position
       mov dh,3      ;row position
       mov bx,0
       int 10h
        
       mov ah,09h
       lea dx,a      ; display a string
       int 21h    
       
       mov ah,02h
       mov dl,0dh   ;carraige reutrn
       int 21h
       
       mov dl,0ah   ; line fied
       int 21h 
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,4     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt 
       
       l1:         
       
       mov ah,09h
       lea dx,user      ; display a string
       int 21h 
       
       mov si ,offset usr ; source index register to access array
       
       b1:
       mov ah,01h         ;here input for user char by char
       int 21h
       
       cmp al,13          ; when user press enter then it will take if password if user name is correct
       je b2              ; b2 block is about taking password  
       
       mov [si],al        ; it will store input value in string
       inc si             ; increment for index
       
       jmp b1             ; shift to block 1 to take again char
            
       b2: 
           
       mov ah,02h
       mov dl,0dh    ;carriage return
       int 21h
       
       mov dl,0ah    ; line fied
       int 21h
       
       ;mov dx,offset usr  ; display string
       ;mov ah,09h
       ;int 21h 
      
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,5     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt  
        
       cmp fortest,'0'
       jne l2
       jmp l3
       
       l2:
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,9     ; row position
       mov bx,0     ; set page
       int 10h  
       l3:
       mov ah,09h
       lea dx,paswd
       int 21h
       
       mov si,offset pswd
       
       b3:
       mov ah,01h
       int 21h
       
       cmp al,13
       je b4
       
       mov [si],al
       inc si
       
       jmp b3 
       
       b4: 
       mov bl,usr
       cmp bl,user1
       jne b5
      
       mov bl,pswd
       cmp bl,paswd1
       jne b5  
       
       jmp b7
       
       b5:
       mov ah,02h
       mov dl,0dh    ;carriage return
       int 21h
       
       mov dl,0ah    ; line fied
       int 21h
       
       mov ah,09h
       lea dx,incorrect_usr_paswd 
       int 21h  
       
       mov ah,02h
       mov dl,0dh    ;carriage return
       int 21h
       
       mov dl,0ah    ; line fied
       int 21h
       
       mov ah,09h
       lea dx,againInput 
       int 21h   
       
       mov ah,01h
       int 21h
       cmp al,13 
       je b6
       
       b6:
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,8     ; row position
       mov bx,0     ; set page
       int 10h 
       
       inc fortest
      
       jmp l1   
       
       
       
       b7: 
                
       mov ah,4ch       
       int 21h
main endp
end main
