assume cs:code, ds:data
data segment

s dw 1a2bh, 0c346h, 78dch, 1213h
len_s equ $-s
d dw len_s/2 dup(0)
zece dw 10
n db 0

data ends

code segment
start:
;se da un sir de dublucuvinte s in segmentul de date. sa se construiasca sirul d care sa contina
;produsul octetilor fiecarui cuvant din sirul s si sa se afiseze acest sir pe ecran.
;se va folosi interpretarea fara semn
;s: 1a2bh, c346h, 78dch, 1213h
;d: 1118, 13650, 26400, 342

mov ax,data
mov ds, ax

mov si, 0
mov di, 0

mov cx, len_s
repeta:
mov al, byte ptr s[si]
inc si
mov bl, byte ptr s[si]
mul bl 
mov d[di], ax

inc si
add di, 2
loop repeta

mov cx, len_s/2
mov di, 0

repetaafisare:
mov n, 0
mov ax, word ptr d[di]
cifra:
inc n
mov dx, 0
div zece
push dx
mov dx, 0
cmp ax, 0
jne cifra

afisare:
dec n
mov ah, 02h
pop dx
add dl, '0'
int 21h
cmp n, 0
jne afisare

mov ah, 02h
mov dl, ' '
int 21h
add di,2
loop repetaafisare

mov ax , 4c00h
int 21h
code ends
end start