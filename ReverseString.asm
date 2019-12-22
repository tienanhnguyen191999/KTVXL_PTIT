
.model tiny
.stack 100h
.data
    str db  100 dup('$')
    endl db 10,13,'$'
.code 
    jmp start
    
start:
    mov ax,@Data
    mov ds,ax
             
    mov dx,offset str
    mov ah, 10
    int 21h
    
    mov bx,offset str + 2
    Lap:     
        call change
        push [bx]
        inc bx
        cmp [bx],'$'
        jne Lap
    jmp end 
    change:
        cmp [bx], 'a'
        jb exit
        cmp [bx], 'z'
        ja exit
        sub [bx],20h
        exit: ret
end:             
    mov dx,offset endl  ;newline                 
    mov ah,9 
    int 21h    
    
    mov ah,2
    print:       ; print Reverse String
        pop dx
        int 21h
        cmp dx,0
        jne print               
        
            
    mov dx,offset endl  ;newline                 
    mov ah,9 
    int 21h
                  
    mov dx,offset str + 2    
    mov ah,9 
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    