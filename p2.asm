assume cs:code, ds:data
data segment

s dd 12443478h, 0ab32cdabh, 0c57673e5h
len_s equ ($-s)/4

d db len_s dup(0)

n db 0

data ends

code segment
start:
;se da un sir de dublucuvinte. sa se genereze sirul d care sa contina toti octetii inferiori
;ai wordurilor superioare care au ultima cifra egala cu 8. sa se afiseze sirul d (in baza 10)
;s: 12443478h, ab32cdabh, c5f373e5h
;d: 44h, 76h
;rezultat: 68, 118

mov ax,data
mov ds, ax

mov di, 0
mov si, 2
mov cx, len_s
repeta:

mov bl, 10
mov al, byte ptr s[si]
cbw
idiv bl
cmp ah, 8
je bun
jne endiff

bun:
mov al, byte ptr s[si]
mov d[di], al
inc di

endiff:
inc si

loop repeta

mov cx, di
mov di, 0

repeta2:
mov n, 0
mov al, d[di]
cbw
cifre:
inc n
mov bx, 10
cwd
idiv bx

push dx
mov dx, 0

cmp ax, 0
jne cifre

afisare:
dec n
mov ah, 02h
pop dx
add dl, '0'
int 21h

cmp n, 0
jne afisare
inc di
mov dl,' '
mov ah,02h
int 21h

loop repeta2

mov ax , 4c00h
int 21h
code ends
end start