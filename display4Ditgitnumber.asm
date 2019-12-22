
.model tiny
.stack 100org
.data
    str db 'ab$$$$$$$' ; 4 digits   
    endl db 10,13,'$'
.code 
    jmp start
start:
    mov ax,@data
    mov ds,ax
    
 
    mov dx, offset endl ; Endline
    mov ah,9
    int 21h                      
              
              
    mov bx, offset str   
    mov ax , 300
    mov cl , 10;
    calculate: 
    div cl        
    mov [bx],ah 
    add [bx],30h
    inc bx
    cmp al, 0
    jne calculate:
    
                        
    
    mov dx, offset str
    mov ah,9
    int 21h
    
    mov ah, 4ch
    int 21h
    
    
    
    
    
    