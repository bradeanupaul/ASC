assume cs:code, ds:data
data segment

a db "Bradeanu Paul-Daniel"
lena equ $-a

data ends
code segment

start:

;afisarea numelui intreg pe ecran

mov ax,data
mov ds,ax

mov cl, lena
mov ch, 0

mov si, 0

repeta:

mov ah, 02h
mov dl, a[si]
int 21h

inc si

loop repeta

mov ax, 4c00h ; terminam programul
int 21h

code ends
end start