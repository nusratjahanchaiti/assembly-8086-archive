.model small
.stack 100h
.code
main proc
    mov cl, 0        ; counter for letters

print_loop:
    mov ah, 02h      ; DOS print character
    mov dl, cl
    add dl, 'A'      ; ASCII 'A' + counter
    int 21h

    ; Optional space
    mov dl, ' '
    int 21h

    inc cl
    cmp cl, 26       ; 26 letters
    jl print_loop

    ; Print newline
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main


      
      



