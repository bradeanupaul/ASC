assume cs:code, ds:data
data segment

n dw 0
d db 10, ?, 10 dup(0)
sir dw 100 dup(0)
trei dw 3
nr dw 0
i db 0
zece dw 10
data ends

code segment
start:
;se da un nr n < 256 in segm de date. sa se genereze si afiseze secventa 3, 6, 9, ..., 3n
;exemplu: n = 6, rezultat = 3, 6, 9, 12, 15, 18

mov ax,data
mov ds, ax

mov ah, 0ah
mov dx, offset d
int 21h
mov cl,d[1]
mov ch,0
mov si,2
puneStiva:
mov al,d[si]
sub al,'0'
mov ah,0
push ax
mov ax,0
inc si
loop puneStiva

mov cl,d[1]
mov ch,0
mov bx,1
numar:
pop dx
mov ax,dx
mul bx
mov dx,ax
add n,dx
mov ax,bx
mul zece
mov bx,ax
loop numar



mov ah, 02h
mov dl, 10
int 21h

mov si,0
mov cx, n
repeta:
mov ax,nr
add ax,trei
mov sir[si],ax
add si,2
mov nr,ax
loop repeta

mov si, 0
mov cx, n
afisare:

mov ax, sir[si]

cif:
inc i
mov dx, 0
div zece
push dx
mov dx, 0

cmp ax, 0
jne cif

afis:
pop dx
add dl, '0'
mov ah, 02h
int 21h
dec i

cmp i, 0
jne afis

mov ah, 02h
mov dl, ' '
int 21h

add si, 2
loop afisare

mov ax , 4c00h
int 21h
code ends
end start