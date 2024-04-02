assume cs:code, ds:data
data segment
s db 1,2,4,6,10,20,25
lens equ $-s
d db lens-1 dup(0)
data ends

code segment
start:
;Se da un sir de octeti S de lungime l. Sa se construiasca 
;sirul D de lungime l-1 astfel incat elementele din D sa 
;reprezinte diferenta dintre fiecare 2 elemente consecutive din S. 
;Exemplu:
;S: 1, 2, 4, 6, 10, 20, 25
;D: 1, 2, 2, 4, 10, 5
mov ax,data
mov ds,ax
mov cx,lens-1
;am atribuit lui cx numarul de repetari
mov si,0
;si este pozitia elementului care se scade
mov di,1
;di este pozitia elementului din care scad
repeta:
mov al,s[di]
sub al,s[si]
mov d[si],al
;rezultatul il adaug in d pe pozitia si
inc di
inc si
;imi cresc pozitiile cu care lucrez
loop repeta

mov ax , 4c00h
int 21h
code ends
end start