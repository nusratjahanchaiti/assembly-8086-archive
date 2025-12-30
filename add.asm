.model small
.stack 100h

.data
num1 db ?
num2 db ?
sum db ?
msg1 db 'Enter first number: $'
msg2 db 0Dh,0Ah,'Enter second number: $'
msg3 db 0Dh,0Ah,'Sum = $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Input first number
    mov ah, 09h
    lea dx, msg1
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num1, al

    ; Input second number
    mov ah, 09h
    lea dx, msg2
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al

    ; Add numbers
    mov al, num1
    add al, num2
    mov sum, al

    ; Display result
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov dl, sum
    add dl, '0'
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
end main




