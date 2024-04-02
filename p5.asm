assume cs:code, ds:data
data segment

a db 10, ?, 10 dup(0)
b db 10 dup(0)
sum db 0
doi db 2
i db 0
zece dw 10

data ends

code segment
start:
;sa se citeasca un sir de cifre in a
;sa se salveze in b cifrele pare si suma lor (afisate)

mov ax,data
mov ds, ax

mov ah, 0ah
mov dx, offset a
int 21h
mov ah, 02h
mov dl, 10
int 21h

mov dl, a[1]
mov dh, 0
mov cx, dx

mov si, 2
mov di, 0
repeta:
mov al, a[si]
sub al, '0'
mov ah, 0
div doi
cmp ah, 0

je par
jne next

par:
mov dl, a[si]
sub dl,'0'
mov b[di], dl
inc di
add sum, dl

next:
inc si

loop repeta

mov cx, di
mov di, 0
afisare:
mov ah, 02h
mov dl, b[di]
add dl, '0'
int 21h

mov ah, 02h
mov dl, ' '
inc di
int 21h

loop afisare

mov ah, 02h
mov dl, 10
int 21h

mov al, sum
mov ah, 0

cifre:
inc i
mov dx, 0
div zece
push dx
mov dx, 0

cmp ax, 0
jne cifre

suma:
pop dx
add dl, '0'
mov ah, 02h
int 21h
dec i
cmp i, 0
jne suma

mov ax , 4c00h
int 21h
code ends
end start