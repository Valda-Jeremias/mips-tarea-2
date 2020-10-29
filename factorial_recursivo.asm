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
