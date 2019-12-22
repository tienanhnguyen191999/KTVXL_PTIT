                      
.model tiny
.stack 100h
.data                                    
    ; Prepare arr
    arr db 1,21,32,43,51,63,7,8,77,10,'$'
    str db 100 dup('$') 
.code            
    jmp start
    
start: 
     mov ax,@data
     mov ds,ax
     
     mov bx, offset arr
     mov cl, 7
     xor dx,dx 
     lap:       
        xor ax,ax
        mov al, [bx]   
        cmp [bx],'$' 
        je print
        call calculate                          
        inc bx
        jmp lap
        
                      
    calculate PROC  
        div cl
        cmp ah,0
        jne  exit 
        add dl, [bx] 
        exit: ret  
    calculate ENDP
        
      ;dx = 168
    print:   
       mov bx, offset str
       mov ax, dx
       mov cl , 10
       lap2:                                         
        xor ah,ah
        div cl
        push ax          ; Push vao Stack de hien thi
        cmp al,0
        jne lap2
        print1:
            pop ax
            mov [bx], ah ; GHI DE` LEN ADDRESS => DISPLay  
            cmp ax,0
            je end
            add [bx], 30h
            inc bx   
            jmp print1
            
      
end:           
    mov cx,dx;
    mov dx, offset str
    mov ah,9
    int 21h

    mov ah, 4ch
    int 21h
            