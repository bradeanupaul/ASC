assume cs:code, ds:data
data segment

s db "{[(-+-)]}"
lens equ $-s
d db 40 dup(0)
chr db "%$"

data ends
code segment

start:

mov ax,data
mov ds,ax

mov cl, lens
mov ch, 0

mov si, 0
mov di, 0

repeta:

mov al, s[si]
cmp al, 'a'
jae mica
jb next

mica:
cmp al, 'z'
jbe bun
ja next

next:
cmp al, 'A'
jae mare
jb rau

mare:
cmp al, 'Z'
jle bun
ja rau

bun:
mov al, s[si]
mov d[di], al
inc si
inc di
jmp endiff

rau:
mov bl, chr[0]
mov d[di], bl
inc si
inc di

endiff:

loop repeta

mov ah, 02h
mov dl, 10
int 21h

mov cl, lens
mov ch, 0

mov si, 0
mov di, 0

afisare:

mov ah, 02h
mov dl, d[di]
int 21h

inc di

loop afisare

mov ax, 4c00h ; terminam programul
int 21h

code ends
end start