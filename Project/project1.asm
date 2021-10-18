.model small
.stack 100h
.data  
a db "******************************************$";
b db "*     WELCOME TO PARKING SYSTEM          *$";
c db "*    By : Sadia Bibi & Nazeer Ahmed       *$";   
user db "User Name : $"
paswd db "Password  : $" 
usr db 15 dup("$")    ; it store 10 char
pswd db 15 dup("$")   ; it store 10 char  
user1 db "Nazeer&Sadia$"
user2 db "Sadia$"
paswd1 db "123$" 
incorrect_usr_paswd db "You entered wrong user name / password $"
againInput db " press 'enter' to input again user name & password$"  
fortest db "0$"

m1 db "************************************************$";
m2 db "* Arrival of Car             (PRESS 1)         *$";   
m3 db "* Arrival of Bike            (PRESS 2)         *$";
m4 db "* Arrival of Bus             (PRESS 3)         *$";
m5 db "* Total No: of Car Arrived   (PRESS 4)         *$";
m6 db "* Total No: of Bike Arrived  (PRESS 4)         *$";
m7 db "* Total No: of Bus Arrived   (PRESS 4)         *$";

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
       
      Call space_code 
       
       mov ah,02h
       mov dl,20    ; column position
       mov dh,1     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt
       
       mov ah,09h
       lea dx,b     ; display a string
       int 21h         
       
       
       Call space_code 
       
       mov ah,02h
       mov dl,20     ; column position
       mov dh,2      ; row position
       mov bx,0      ;set page
       int 10h       ;vedio inturppt
       
       mov ah,09h
       lea dx,c      ;display a string
       int 21h   
       
      Call space_code 
        
        mov ah,02h
       mov dl,20     ;column position
       mov dh,3      ;row position
       mov bx,0
       int 10h
        
       mov ah,09h
       lea dx,a      ; display a string
       int 21h    
       
       Call space_code 
       
       l1:
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,4     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt 
       
               
       
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
           
       Call space_code 
       
       ;mov dx,offset usr  ; display string
       ;mov ah,09h
       ;int 21h 
      
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,5     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt  
        
     ;  cmp fortest,'0'
     ;  jne l2
      ; jmp l3
       
    ;   l2:
    ;   mov ah,02h  
     ;  mov dl,15    ; column position
      ; mov dh,9     ; row position
       ;mov bx,0     ; set page
       ;int 10h  
       ;l3:
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
       sub bx,bx
       
       mov bl,usr   
       cmp bl,user1   
       jne b5
          
       mov bl,pswd
       cmp bl,paswd1  
       jne b5  
       
       jmp b7
       
       b5:
       Call space_code 
       
       mov ah,09h
       lea dx,incorrect_usr_paswd 
       int 21h  
       
      Call space_code 
       
       mov ah,09h
       lea dx,againInput 
       int 21h   
       
       mov ah,01h
       int 21h
       cmp al,13 
       je b6
       
       b6: 
        MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
        MOV BH,71H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
        MOV CX,0000H    ;STARTING COORDINATES
        MOV DX,184FH    ;ENDING COORDINATES
        INT 10H  
      
       ;mov ah,02h  
       ;mov dl,15    ; column position
       ;mov dh,8     ; row position
       ;mov bx,0     ; set page
       ;int 10h 
       
       ;inc fortest
      
       jmp l1   
 
       b7: 
       mov ah,02h
       mov dl,0dh
       int 21h
       
       mov al,0ah
       int 21h
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,8     ; row position
       mov bx,0     ; set page
       int 10h    
       
       mov ah,09h
       lea dx,m1
       int 21h    
       
       Call space_code 
       
       mov ah,02h
       mov dl,15
       mov dh,9
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m2
       int 21h    
       
       Call space_code  
       
       mov ah,02h
       mov dl,15
       mov dh,10
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m3
       int 21h
       
       Call space_code
       
       mov ah,02h
       mov dl,15
       mov dh,11
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m4
       int 21h
       
       Call space_code 
       
       mov ah,02h
       mov dl,15
       mov dh,12
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m4
       int 21h
       
       call space_code
       
       mov ah,02h
       mov dl,15
       mov dh,13
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m5
       int 21h
       
       call space_code
       
       mov ah,02h
       mov dl,15
       mov dh,14
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m1
       int 21h
       
                
       mov ah,4ch       
       int 21h
main endp 

space_code  proc
    
    mov ah,02h
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h
    
    RET 
    
space_code endp

end main

