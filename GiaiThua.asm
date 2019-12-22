
.model tiny
.stack 100h
.data
    str db 100 dup('$')     
    endl db 10,13,'$'
    output db 100 dup('$')
.code
    jmp start
    
start:
    mov ax,@data
    mov ds,ax
    
    mov ah, 1
    int 21h
                   
    xor cx,cx
    sub al,30h         
    mov cl,al
    mov ax,1
    giaithua:      
        mul cx
        loop giaithua
        
    mov bx,offset output
    mov cl, 10
    lap1:
        div cx
        push dx 
        xor dx,dx
        cmp ax,0
        je lap2  
        jne lap1
        
    lap2:
        pop dx     
        cmp bp,sp
        je end
        mov [bx],dl
        add [bx],30h
        inc bx
        jmp lap2
        
end:         
    mov dx,offset endl
    mov ah,9
    int 21h
                     
    mov dx, offset output   
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h        