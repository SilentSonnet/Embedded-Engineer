assume cs:code
code segment
    mov ax, 20h
    mov ds, ax
    mov bx, 0h

    mov cx, 64
s:  mov [bx], bl
    add bx, 1
    loop s

    mov ax, 4c00h
    int 21h
code ends
end
