.data
prompt: .asciiz "Ingrese un numero: "

.text
.globl main

# --- funcion main ---
main:
li       $v0, 4              #
la       $a0, prompt         #
syscall                      # printf("Ingrese un numero: ");
li       $v0, 5              #
syscall                      # scanf("%d", &n);
move     $a0, $v0            #
jal      factorial           # factorial(n);
move     $a0, $v0            #
li       $v0, 1              #
syscall                      # printf("%d\n", res);
li       $v0, 10             #
syscall                      #

# --- funcion factorial ---
factorial:
# --- prologo ---
addi     $sp, $sp, -12       # stack frame de 3 words
sw       $a0, 0($sp)         #
sw       $s0, 4($sp)         #
sw       $ra, 8($sp)         #

# --- cuerpo de la funcion ---
# chequeamos si estamos en el caso base (factorial de 0)
beq      $a0, $zero, base    # if (n == 0) goto base
# no es caso base
move     $s0, $a0            # $s0 = n
addi     $a0, $a0, -1        # para llamar factorial(n - 1)
jal      factorial           # llamada recursiva
mul      $v0, $v0, $s0       # return factorial(n - 1) * n
j        return              #

base:
li       $v0, 1              # si es caso base devolvemos 1
j        return              #

return:
# --- epilogo ---
lw       $a0, 0($sp)         # restauramos los registros
lw       $s0, 4($sp)         #
lw       $ra, 8($sp)         #
addi     $sp, $sp, 12        #
jr       $ra                 # return


.data
ingrese: .asciiz "Ingrese un numero: "

.text
.globl main
main:
#Pido y Guardo un numero del usuario
li $v0, 4
la $a0, ingrese
syscall

li $v0, 5
syscall
move $a0, $v0
#-------------------------------------
jal factorial	#Factorial de $a0
#-------------------------------------

#Imprimo resultado
move $a0, $v0
li $v0, 1
syscall
#-------------------------------------

#exit
li $v0, 10
syscall
#-------------------------------------

factorial:
#Prologo
addi $sp, $sp, -12	#Genero 12 lugares (3 registros)
sw $a0, 0($sp)		#Guardo $a0
sw $t2, 4($sp)		#Guardo $t2
sw $ra, 8($sp)		#Guardo $ra
#-------------------------------------

#Casos base
li $t0, 1
beq $a0, $t0, f1f0	#si $a0 = 1, expulsa 1
beq $a0, $zero, f1f0	#si $a0 = 0, expulsa 1
#-------------------------------------

#No es caso base
move $t2, $a0
addi $a0, $a0, -1	#restamos 1 a n
jal factorial		#factorial(n-1)
move $t1, $v0		#Copiamos el resultado de fact(n-1) a $t1
mul $v0, $t1, $t2	#factorial(n-1)*n
j return
#-------------------------------------

f1f0:
li $v0, 1
j return
#-------------------------------------

return:
# epilogo
lw $a0, 0($sp)
lw $t2, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12
jr $ra
#-------------------------------------
