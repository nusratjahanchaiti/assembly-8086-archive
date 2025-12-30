.model small
.stack 100h

.data
num1 db ?
num2 db ?
prod db ?
msg1 db 'Enter first number: $'
msg2 db 0Dh,0Ah,'Enter second number: $'
msg3 db 0Dh,0Ah,'Product = $'

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
    mov num1, al

    mov ah, 09h
    lea dx, msg2
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al

    mov al, num1
    mul num2
    mov prod, al

    mov ah, 09h
    lea dx, msg3
    int 21h

    mov dl, prod
    add dl, '0'
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
end main



