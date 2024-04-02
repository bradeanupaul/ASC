assume cs:code, ds:data
data segment
s dw 20,?,20 dup(0)
sum dw 0
data ends

code segment
start:
;Sa se citeasca de la tastatura un sir de cuvinte si sa se afiseze suma lor in baza 2

mov ax,data
mov ds, ax
mov ah, 0ah
mov dx, offset s
int 21h
mov si, 2
mov cl,s[1]
mov ch, 0
repeta:
mov ax,s[si]
add sum, ax
add si, 2
loop repeta
mov ax, sum
acces_bin:
shl ax, 1
jc afisare1
jnc afisare0
afisare1:
mov dl, '1'
mov ah, 02h
int 21h
jmp myendif
afisare0:
mov dl, '0'
mov ah, 02h
int 21h
myendif:
loop acces_bin

mov ax , 4c00h
int 21h
code ends
end start