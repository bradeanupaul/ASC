assume cs:code, ds:data
data segment
a db 5
b db 3
c db 25
d db 2
interm dw ?
data ends
code segment
incepe:
mov ax, data
mov ds, ax
;z=(a+b+c+1)*(a+b+c+1)/((a-b+d)*(a-b+d))
;a+b+c+1
mov al, a
add al, b
add al, c
add al, 1
;al = a+b+c+1
;ridicam paranteza la patrat
imul al
;ax=(a+b+c+1)^2
mov bx, ax
;(a-b+d)
mov al, a
sub al, b
add al, d
;al = a-b+d
;ridicam paranteza la patrat
imul al
;ax = (a-b+d)^2
mov interm , ax
mov ax,bx
cwd 
;impartim parantezele
idiv interm
;ax = catul impartirii
mov ax, 4C00h
int 21h
code ends
end incepe