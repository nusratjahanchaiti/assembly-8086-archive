.model small
.stack 100h

.data
n db ?
arr db 10 dup(?)      ; array max 10 elements
msg1 db 'Enter number of elements (max 10): $'
msg2 db 0Dh,0Ah,'Enter element: $'
msg3 db 0Dh,0Ah,'Sorted Array: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Input n
    mov ah, 09h
    lea dx, msg1
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov n, al

    ; Input array elements
    mov cl, n
    mov ch, 0
    mov si, 0

input_loop:
    mov ah, 09h
    lea dx, msg2
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov arr[si], al
    inc si
    loop input_loop

    ; Bubble Sort
    mov cl, n
    dec cl                 ; number of passes
outer_loop:
    mov si, 0
    mov ch, cl

inner_loop:
    mov al, arr[si]
    mov bl, arr[si+1]
    cmp al, bl
    jbe skip_swap

    ; Swap
    mov arr[si], bl
    mov arr[si+1], al

skip_swap:
    inc si
    dec ch
    jnz inner_loop

    dec cl
    jnz outer_loop

    ; Print sorted array
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov cl, n
    mov ch, 0
    mov si, 0

print_loop:
    mov dl, arr[si]
    add dl, '0'
    mov ah, 02h
    int 21h
    inc si
    loop print_loop

    ; Exit
    mov ah, 4Ch
    int 21h
end main
