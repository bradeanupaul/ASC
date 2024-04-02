assume cs:code, ds:data
data segment

s db 10, ?, 10 dup(0)
sum dw 0
saispe dw 16
nr db 0

data ends

code segment
start:
;se da un sir de octeti s. sa se afiseze pe ecran suma lor in baza 16

mov ax,data
mov ds, ax

mov ah, 0ah
mov dx, offset s
int 21h

mov cl, s[1]
mov ch, 0
mov si, 2
repeta:
mov al, s[si]
mov ah, 0
sub ax,'0'
add sum, ax
inc si
loop repeta



mov ah, 02h
mov dl, 10
int 21h

mov ax, sum

stiva:
inc nr
mov dx, 0
div saispe

cmp dx, 9
ja litere
jbe cifre

litere:
add dx, 'A'-10
jmp next

cifre:
add dx, '0'
jmp next

next:
push dx
mov dx, 0

cmp ax, 0
jne stiva

mov cl, nr
mov ch, 0

afisare:
pop dx
mov ah,02h
int 21h

loop afisare

mov ax , 4c00h
int 21h
code ends
end start