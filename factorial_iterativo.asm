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
li       $v0, 1              # int resultado = 1;
loop:
beq      $a0, $zero, exit    # while (n > 0)
mul      $v0, $a0, $v0       # resultado *= n;
addi     $a0, $a0, -1        # n--;
j        loop                #
exit:
jr       $ra                 # return
