.model small
.stack 100h

.data
num1 db ?
num2 db ?
quot db ?
msg1 db 'Enter dividend: $'
msg2 db 0Dh,0Ah,'Enter divisor: $'
msg3 db 0Dh,0Ah,'Quotient = $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Input dividend
    mov ah, 09h
    lea dx, msg1
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num1, al

    ; Input divisor
    mov ah, 09h
    lea dx, msg2
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al

    ; Divide
    mov al, num1
    cwd             
    mov bl, num2
    div bl          
    mov quot, al

    ; Display result
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov dl, quot
    add dl, '0'
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
end main





