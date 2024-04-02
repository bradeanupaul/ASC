assume cs:code, ds:data
data segment

s db 100, ?, 100 dup(0)
da db "da$"
nu db "nu$"
chr db 0

data ends

code segment
start:
;sa se citeasca un sir de caractere si un caracter de la tastatura
;si sa se afiseze pe ecran daca caracterul apare in sir
;"ana are mere"

mov ax,data
mov ds, ax

mov ah, 0ah
mov dx, offset s
int 21h

mov ah, 02h
mov dl, 10
int 21h

mov ah, 01h
int 21h

mov ah, 02h
mov dl, 10
int 21h

mov chr, al

mov cl, s[1]
mov ch, 0
mov si, 2
repeta:
mov dl, s[si]
cmp dl, chr
je dap
inc si
loop repeta

jmp next

dap:
mov ah, 09h
mov dx, offset da
int 21h
jmp endiff

next:
mov ah, 09h
mov dx, offset nu
int 21h

endiff:

mov ax , 4c00h
int 21h
code ends
end start