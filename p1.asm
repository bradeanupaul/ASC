assume cs:code, ds:data
data segment

s db 50, ?, 50 dup(0)
n dw 0
i db 0

data ends

code segment
start:
;sa se citeasca un sir de caractere si sa se afiseze cate litere contine
;exemplu:
;s: "ana are 3 mere!"
;rezultat: 10

mov ax,data
mov ds, ax

mov ah, 0ah
mov dx, offset s
int 21h

mov si, 2
mov cl, s[1]
mov ch, 0

repeta:
mov al, s[si]

cmp al, 'a'
jae mare
jb endiff

mare:
cmp al, 'z'
jbe bun
ja endiff

bun:
inc n
endiff:
cmp al, 'A'
jae maimare
jb endiff2

maimare:
cmp al, 'Z'
jbe maibun
ja endiff2

maibun:
inc n

endiff2:
inc si
loop repeta

mov ax, n
mov dx,0
cifre:
inc i
mov bx, 10
div bx
push dx
mov dx,0
cmp ax, 0
jne cifre

mov dl, 10
mov ah, 02h
int 21h

afisare:
dec i
pop dx
add dl, '0'
mov ah, 02h
int 21h
cmp i, 0
jne afisare

mov ax , 4c00h
int 21h
code ends
end start