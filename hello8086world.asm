.model small
.stack 100h
.data
msg db 'Hello, 8086 World!$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h    ; DOS print string
    lea dx, msg
    int 21h

    mov ah, 4Ch    ; Exit program
    int 21h
end main




