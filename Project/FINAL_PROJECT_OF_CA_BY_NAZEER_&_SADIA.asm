.model small
.stack 100h
.data  
a db "******************************************$";
b db "*     WELCOME TO CAR PARKING SYSTEM      *$";
c db "*    By : Sadia Bibi & Nazeer Ahmed       *$";   
user db "User Name : $"
paswd db "Password  : $" 
usr db 12 dup("$")    ; it store 12 char
pswd db 10 dup("$")   ; it store 10 char  
user1 db 'Nazeer&Sadia'  ; array
paswd1 db '123'          ; array
incorrect_usr_paswd db "You entered wrong user name / password $"
againInput db " press 'enter' to input again user name & password$"  
fortest db "0$"           
maincmp db ?                              
selectmainmenu db "CHOOSE THE OPTION : $"  
cararvl0 db "------*ARRIVAL OF CAR*-------$"   
cararvl1 db "PER HOUR PAYMENT IS : 100/=$"
cararvl2 db "DRIVEER NAME     : $"
cararvl3 db "CAR NO           : $"
cararvl4 db "DURATION/HOUR    : $"
cararvl5 db "TOTAL AMOUNT     : $"
car_driver_name db 20 dup("$")
counter1 db ?
car_no db 20 dup("$") 
counter2 db ?
car_duration  3 dup("$") 
counter3 db ?
car_total_amount db ?
car_park_done db ?  
pressanykey db "press any ke !$" 
total dw "-> TOTAL NO OF CAR :$"    
countcar db '0$'
HANDLE DW ?
BUFFER DB 25 DUP(?)
COUNTT DB 0 
COUNTT1 DB 0 

drvd db "---**DRIVER DATA**---$"


        


m1 db "************************************************$";
m2 db "* Arrival of Car             (PRESS 1)         *$";   
m3 db "* Display car recordes       (PRESS 2)         *$";
m4 db "* Total No: of Car Arrived   (PRESS 3)         *$";  
FNAME DB 'driverdata',0
FNAME1 DB 'carno',0
FNAME2 DB 'duration',0

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
       
      Call space_code    ; this proc for space 
       
       mov ah,02h
       mov dl,20    ; column position
       mov dh,1     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt
       
       mov ah,09h
       lea dx,b     ; display a string
       int 21h         
       
       
       Call space_code    ; this is user defined proc including space code
       
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
       
       call space_code
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
            
       push ax
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
        
        ;cmp fortest,'0'
        ;jne l2
        ;jmp l3
       
        ;l2:
        ;mov ah,02h  
        ;mov dl,15    ; column position
        ;mov dh,9     ; row position
        ;mov bx,0     ; set page
        ;int 10h  
        ;l3:
       
       mov ah,09h
       lea dx,paswd    ; display a string
       int 21h
       
       mov si,offset pswd   ;source index register to access a array
       
       b3:                 ; this block for taking password
       mov ah,01h
       int 21h
       
       cmp al,13
       je b4
       
       mov [si],al         ; strong in array
       inc si               ;increment in index
       
       jmp b3 
       
       b4: 
       mov si,offset usr     ;source index register to acess a array
       mov di,offset user1  
       mov cx,12             ; loop for compare give user name to stored user name
       arrayusercmp:         ;loop block
       mov al,[si]           ;assinging char by char
       mov bl,[di]           ;assinging char by char
      
       cmp al,bl             ; compare char
       jne b5                ; if char or not equall it jump to b5
       inc si                ;increment in index
       inc di                ;increment in index
       loop arrayusercmp     ;end loop
       ;mov bl,usr   
       ;cmp bl,user1   
       ;jne b5
          
       mov si,offset pswd    ;source index register to access a array
       mov di,offset paswd1  
       
       mov cx,3
       arraypswdcomp:
       mov al,[si]             ;assinging char by char
       mov bl,[di]              ;assinging char by char
       cmp al,bl                 ;cmpare char
       jne b5  
      
       inc si 
       inc di
       loop arraypswdcomp         ;end of loop
       
       jmp b7                     ; if user name or paswd correct then it will jump on b7
                                  
       b5:                   ; if user/paswd enter incorect then this block is to entering again paswd and username
       Call space_code 
       
       mov ah,09h
       lea dx,incorrect_usr_paswd    ; if user enter wrong username/password then it will display msg
       int 21h  
       
      Call space_code 
       
       mov ah,09h
       lea dx,againInput              ; for entering again user name / password
       int 21h   
       
       mov ah,01h
       int 21h
       cmp al,13 
       je b6
       
       b6: 
        MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
        MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
        MOV CX,0000H         ;STARTING COORDINATES
        MOV DX,184FH         ;ENDING COORDINATES
        INT 10H  
      
       ;mov ah,02h  
       ;mov dl,15    ; column position
       ;mov dh,8     ; row position
       ;mov bx,0     ; set page
       ;int 10h 
       
       ;inc fortest
      
       jmp l1   
 
       b7:
         top: 
       call main_menu        ; this proc include main menu of project
        
      
       call space_code
      wronginput:
       call space_code  
       
       mov ah,09h
       lea dx,selectmainmenu
       int 21h
       
       mov counter1,'0' 
      
     ; sub ax,ax 
      mov ah,01h
   int 21h
   
   cmp al,'1'
   je menub1
   cmp al,'2'
   je menub2
   cmp al,'3'
   je menub3 
   jmp last
   
   menub1:  
      call menu1
   menub2:
      call menu2
   menub3:
      call menu3
      
      
         last:
         
       mov ah,4ch       
       int 21h
main endp 

space_code  proc         ; this proc include carriage return and line fied
    
    mov ah,02h
    mov dl,0dh
    int 21h
    
    mov dl,0ah
    int 21h
    
    RET 
    
space_code endp         ; end of space_code

main_menu proc           ; include main menu
    
       call space_code
       
       mov ah,02h  
       mov dl,15    ; column position
       mov dh,8     ; row position
       mov bx,0     ; set page
       int 10h    
       
       mov ah,09h
       lea dx,m1        ; display a string
       int 21h    
       
       Call space_code       ; call to a proc
       
       mov ah,02h
       mov dl,15            ; column postion
       mov dh,9             ; row position
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m2          ; display a string 
       int 21h    
       
       Call space_code  
       
       mov ah,02h
       mov dl,15          ; column position
       mov dh,10          ;row postion 
       mov bx,0
       int 10h
       
       mov ah,09h
       lea dx,m3        ; display a string
       int 21h
       
       Call space_code
       
       mov ah,02h
       mov dl,15        ;column position
       mov dh,11        ; row position
       mov bx,0
       int 10h           ;vedio intrupt
       
       mov ah,09h
       lea dx,m4         ; display a string
       int 21h
       
       Call space_code 
       
       
       mov ah,02h
       mov dl,15       ;column position
       mov dh,12       ;row position
       mov bx,0         ;set page 
       int 10h           ;vedio inturpt
       
       mov ah,09h
       lea dx,m1        ; display a string]
       int 21h
       
    ret
main_menu endp 
menu1 proc  
    
     MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
     MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
     MOV CX,0000H         ;STARTING COORDINATES
     MOV DX,184FH         ;ENDING COORDINATES
     INT 10H  
     
      mov ah,02h  
      mov dl,20    ; column position
      mov dh,0     ; row position
      mov bx,0     ; set page
      int 10h      ; vedio interrupt
  
    mov ah,09h
    lea dx,cararvl0  
    int 21h
    
    call space_code 
    
      mov ah,02h  
      mov dl,20    ; column position
      mov dh,1     ; row position
      mov bx,0     ; set page
      int 10h      ; vedio interrupt  
    
    
     mov ah,09h
    lea dx,cararvl1 
    int 21h
   
    
    call space_code
    
     mov ah,09h
    lea dx,cararvl2  
    int 21h  
      mov di ,offset car_driver_name
     takevalue:
    mov ah,01h
    int 21h
     
    cmp al,13
    je carjump 
    
    mov [di],al
    inc di
    inc COUNTT
    jmp takevalue
                
     carjump:
    
    call space_code
    
     mov ah,09h
    lea dx,cararvl3  
    int 21h 
    
    mov di ,offset car_no
     takevalue1:
    mov ah,01h
    int 21h
     
    cmp al,13
    je carjump1 
    
    mov [di],al
    inc di
    INC COUNTT1
    jmp takevalue1
                
     carjump1:
    
    call space_code
    
     mov ah,09h
    lea dx,cararvl4  
    int 21h   
    
     mov di ,offset car_duration
     takevalue2:
    mov ah,01h
    int 21h
     
    cmp al,13
    je carjump2 
    
    mov [di],al
    inc di  
    
    jmp takevalue2
                
     carjump2:
    sub bx,bx 
    mov bl,car_duration
    
    call space_code
    
     mov ah,09h
    lea dx,cararvl5  
    int 21h
   mov si, offset car_duration
   
  
    sub cx,cx
   mov cl,bl
   sub bx,bx
   mov bx,'0'
    
  
   l2:
 inc bx  
 ;inc counter1
   loop l2    
   
   sub bx,48  
   mov ah,02h
   mov dx,bx
   int 21h 
   
   mov ah,02h
   mov dl,'0'
   int 21h
   
   mov dl,'0'
   int 21h
    
    call space_code
    
    
    inc countcar    
    
mov ah,3DH
mov dx,offset(FNAME)
MOV AL,1                ; IF 0 THEN OPEN IN READING MODE 
                        ; 1 FOR WRITE AND 2 READ AND WRITE 
INT 21H
MOV HANDLE,AX 

MOV AH,40H  ; FOR WRITNG ANY DATA IN FILE
MOV BX,HANDLE
MOV CX,25     ; HOW MUCH BYTE U WANT TO STORE
MOV DX,OFFSET(car_driver_name)
INT 21H

MOV AH,3EH
MOV DX,HANDLE
INT 21H    

mov ah,3DH
mov dx,offset(FNAME1)
MOV AL,1                ; IF 0 THEN OPEN IN READING MODE 
                        ; 1 FOR WRITE AND 2 READ AND WRITE 
INT 21H
MOV HANDLE,AX 

MOV AH,40H  ; FOR WRITNG ANY DATA IN FILE
MOV BX,HANDLE
MOV CX,25     ; HOW MUCH BYTE U WANT TO STORE
MOV DX,OFFSET(car_no)
INT 21H

MOV AH,3EH
MOV DX,HANDLE
INT 21H  


    
    mov ah,09h
    lea dx,pressanykey
    int 21h
    
    mov ah,01h
    int 21h
    
     MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
     MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
     MOV CX,0000H         ;STARTING COORDINATES
     MOV DX,184FH         ;ENDING COORDINATES
     INT 10H  
    
    jmp top
    
    ret
menu1 endp

menu2 proc
    
     MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
     MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
     MOV CX,0000H         ;STARTING COORDINATES
     MOV DX,184FH         ;ENDING COORDINATES
     INT 10H  
      
      
       mov ah,02h  
       mov dl,0    ; column position
       mov dh,0     ; row position
       mov bx,0     ; set page
       int 10h      ; vedio interrupt
        
    
mov ah,3DH
LEA dx,FNAME
MOV AL,0               ; IF 0 THEN OPEN IN READING MODE   1 FOR WRITE AND 2 READ AND WRITE
INT 21H  
MOV HANDLE,AX 

MOV AH,3FH  ; FOR WRITNG ANY DATA IN FILE
MOV BX,HANDLE 
LEA DX,BUFFER
MOV CX,25     ; HOW MUCH BYTE U WANT TO STORE
INT 21H 

MOV AH,3EH
MOV DX,HANDLE
INT 21H  

call space_code   

mov ah,09h
lea dx,drvd
int 21h
call space_code 

mov ah,09h
lea dx,cararvl2
int 21h   


MOV SI,OFFSET(BUFFER)
     LOP:
    MOV AH,02H
    MOV DL,[SI]
    INT 21H 
    inc SI
    DEC COUNTT  
    JNZ LOP   
    
   call space_code
   
 mov ah,3DH
LEA dx,FNAME1
MOV AL,0               ; IF 0 THEN OPEN IN READING MODE   1 FOR WRITE AND 2 READ AND WRITE
INT 21H  
MOV HANDLE,AX 

MOV AH,3FH  ; FOR WRITNG ANY DATA IN FILE
MOV BX,HANDLE 
LEA DX,BUFFER
MOV CX,25     ; HOW MUCH BYTE U WANT TO STORE
INT 21H 

MOV AH,3EH
MOV DX,HANDLE
INT 21H  


mov ah,09h
lea dx,cararvl3
int 21h   

MOV SI,OFFSET(BUFFER)
    LOP1:
    MOV AH,02H
    MOV DL,[SI]
    INT 21H 
    inc SI
    DEC COUNTT1 
    JNZ LOP1
        
        
        call space_code
    
     mov ah,09h
    lea dx,pressanykey
    int 21h
    
    mov ah,01h
    int 21h
    
     MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
     MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
     MOV CX,0000H         ;STARTING COORDINATES
     MOV DX,184FH         ;ENDING COORDINATES
     INT 10H  
    
    jmp top  
  
  
   
    
ret
menu2 endp 

menu3 proc 
   
   call space_code
   
    mov ah,09h
    lea dx,m1
    int 21h
    
    call space_code
            
    mov ah,09h
    lea dx,total
    int 21h 
    
    
    mov ah,09h
    lea dx,countcar
    int 21h 
    
    call space_code
   
    mov ah,09h
    lea dx,m1
    int 21h 
     call space_code
      mov ah,09h
    lea dx,pressanykey
    int 21h
    
    
      mov ah,01h
    int 21h
    
     MOV AX,0600H         ;06 TO SCROLL & 00 FOR FULLJ SCREEN
     MOV BH,71H           ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
     MOV CX,0000H         ;STARTING COORDINATES
     MOV DX,184FH         ;ENDING COORDINATES
     INT 10H  
    
    jmp top
       
   
ret
menu3 endp

end main

