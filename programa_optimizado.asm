# Laboratorio: Estructura de Computadores
# Actividad: Optimizaciï¿½n de Pipeline en Procesadores MIPS
# Objetivo: Calcular Y[i] = A * X[i] + B e identificar riesgos de datos.

.data
    vector_x: .word 1, 2, 3, 4, 5, 6, 7, 8
    vector_y: .space 32          # Espacio para 8 enteros (8 * 4 bytes)
    const_a:  .word 3
    const_b:  .word 5
    tamano:   .word 8

.text
.globl main

main:
    la   $s0, vector_x      # puntero X
    la   $s1, vector_y      # puntero Y
    lw   $t0, const_a       # A
    lw   $t1, const_b       # B
    lw   $t2, tamano        # tamaño
    li   $t3, 0             # i = 0

loop:
    beq $t3, $t2, fin        

    sll  $t4, $t3, 2         
    addu $t5, $s0, $t4      
    addu $t9, $s1, $t4      

    lw   $t6, 0($t5)        

    addi $t3, $t3, 1         

    mul  $t7, $t6, $t0       
    addu $t8, $t7, $t1       

    sw   $t8, 0($t9)         
    j loop

fin:
    li $v0, 10
    syscall
