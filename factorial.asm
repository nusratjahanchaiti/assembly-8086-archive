.model small
.stack 100h

.data
num db ?
fact dw 1
msg1 db 'Enter number: $'
msg2 db 0Dh,0Ah,'Factorial = $'

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num, al

    mov cl, num
    mov ch, 0           ; CX = num
    mov ax, 1

fact_loop:
    mul cl
    loop fact_loop

    mov ah, 09h
    lea dx, msg2
    int 21h

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
end main




