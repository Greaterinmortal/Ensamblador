#Dado el siguiente segmento de datos donde se definen un conjunto de datos sin signo de tipo 
#byte a partir de la dirección "datosb", realizar un programa que los lea uno a uno y los almacene 
#a continuación, a partir de la dirección "datosw", pero de tipo word (4 bytes por dato)

#----------------------------------
#i = 0;

#while (i < N) {
    #datosw[i] = datosb[i];
    #i++;
#}
#----------------------------------

.data
    datosb: .byte 1, 2, 6
    .align 2 #2^n, n -> propio numero
    datosw: .space 12

    .text
    .globl main

main:
    la $t0, datosb         #Guardamos en t0 datosb
    la $t1, datosw         #Guardamos en t1 datosw
    li $t2, 3              #N=3
    li $t3, 0              #i=0

bucle:
    beq  $t2, $t3, fin_programa
    
    lbu $t4, 0($t0)        #Guardamos en t4 el registro de byte sin signo
    sw $t4, 0($t1)         #Guarda del byte con ceros en datosw
    lw $a0, 0($t1)
    li $v0, 1
    syscall

    addi $t0, $t0, 1       #Avanzamos uno en datosb
    addi $t1, $t1, 4       #Avanzamos uno en datosw
    addi $t3, $t3, 1       #Sumamos 1 añ contador

    j bucle

fin_programa:
    li $v0, 10
    syscall