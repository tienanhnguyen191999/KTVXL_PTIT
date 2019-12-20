
.Model Small
.Stack 100h
.Data 
    str db 100 dup('$')      
    endl db 10,13,'$'
.Code 
    jmp start
start:
    mov ax,@Data
    mov ds,ax
                     
    ; Input                     
    mov dx, offset str                     
    mov ah,10
    int 21h
           
    mov bx, offset str + 2
                 
    lap:                 
    call change   
    inc bx
    cmp [bx],'$'
    jne lap
    je end           
           
    change:
        cmp [bx],'a'
        jb exit
        cmp [bx], 'z'
        ja exit
        sub [bx], 20h
        exit: ret                   
          
end:       
    ;endl    
    mov dx, offset endl;
    mov ah,9
    int 21h

    ;Output        
    mov dx, offset str + 2
    int 21h
    mov ah, 2   
    
                  
    mov ah,4ch
    int 21h
            