assume cs:code, ds:data
data segment

s dd 12443478h, 0ab32cdabh, 0c576b1e5h
ls equ ($-s)/4
d db ls dup(0)
zece1 db 10
zece dw 10
i db 0

data ends

code segment
start:
;se da un sir de dublucuvinte. sa se genereze d care contine toti octetii inferiori
;ai wordurilor superioare cu ult cif egala cu 8. sa se afiseze in baza 10

mov ax,data
mov ds, ax

mov si, 2
mov di, 0
mov cx, ls

repeta:

mov al, byte ptr s[si]
mov ah, 0

div zece1
cmp ah, 8
je adaug
jne next

adaug:

mov al, byte ptr s[si]
mov d[di], al
inc di

next:
add si, 4

loop repeta

mov cx, di
mov di, 0
afisare:

mov al, d[di]
mov ah, 0


cifra:
inc i
mov dx, 0
div zece
push dx
mov dx, 0
cmp ax, 0
jne cifra

afara:
dec i
mov ah, 02h
pop dx
add dl, '0'
int 21h

cmp i, 0
jne afara

mov ah, 02h
mov dl, ' '
int 21h
inc di
loop afisare

mov ax , 4c00h
int 21h
code ends
end start