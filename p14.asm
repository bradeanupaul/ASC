assume cs:code, ds:data
data segment
a dd 12345678h , 4d163a42h
len_a equ ($-a)/4
b1 db len_a dup(0)
b2 db len_a dup(0)
data ends
 
code segment
start:
;Se da un sir A de dublucuvinte. 
;Construiti doua siruri de octeti  
; - B1: contine ca elemente partea inferioara a cuvintelor inferioara din A
; - B2: contine ca elemente partea superioara a cuvintelor superioare din A
mov ax,data
mov ds,ax
mov cx,len_a
;imi atribui in cx numarul de repetari
mov si,0 ;(pe pozitiile 0 si 4 se afla elementele de care am nevoie)
;si este pozitia de pe care iau elementele
mov di,0
;di este pozitia pe care adaug elementele
repeta:
mov al,byte ptr a[si]
;adaug elementul in registrul al
mov b1[di],al
;mut elementul pe b1
add si,4
;ma duc la urmatoarea pozitie de pe care trebuie sa iau element
inc di
;maresc pozitia pe care adaug
loop repeta
mov si,3 ;(pe pozitiile 3 si 7 se afla elementele de care am nevoie)
;si este pozitia de pe care iau elementele
mov di,0
;di este pozitia pe care adaug elementele
mov cx,len_a
repeta2:
mov al,byte ptr a[si]
;adaug elementul in registrul al
mov b2[di], al
;mut elementul pe b2
add si,4
;ma duc la urmatoarea pozitie de pe care trebuie sa iau element
inc di
;maresc pozitia pe care adaug
loop repeta2



mov ax , 4c00h
int 21h
code ends
end start