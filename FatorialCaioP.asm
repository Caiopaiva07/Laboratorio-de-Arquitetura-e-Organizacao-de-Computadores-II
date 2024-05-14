    .data
output_message: .asciiz "O fatorial de 10 �:"
    .text
    .globl main
    
main:
    # Chamada da fun��o fatorial(10)
    li $a0, 10            
    jal fatorial         	 # Coloca o valor 10 em N e chama a fun��o, o retorno da fun��o � colocado em $t0
    move   $t0, $v0         

    # Impress�o do resultado
    li $v0, 4             
    la $a0, output_message  	# Imprime a mensagem pr� programada
    syscall
    
    li $v0, 1             
    move $a0, $t0         	# Imprime o resultado da fun��o 
    syscall

    # Encerrar programa
    li $v0, 10            
    syscall

fatorial:
    # Prologue
    addi $sp, $sp, -8           # Faz espa�o na pilha para salvar $ra e $s0
    sw $ra, 4($sp)              # Salva $ra na pilha
    sw $s0, 0($sp)              # Salva $s0 na pilha
    move $s0, $a0               # Salva N em $s0

    # Corpo da fun��o
    li $v0, 1                   # se N <= 1, retorna 1
    ble $s0, $v0, return_value

    # Chamada recursiva: fatorial(n-1)
    addi $a0, $s0, -1           # N - 1
    jal fatorial                # Chamada recursiva
    move $t0, $v0               # Move o resultado (em $v0) para $t0

    # C�lculo do fatorial:
    mul $v0, $s0, $t0

return_value:
    lw $ra, 4($sp)        # Restaura $ra da pilha
    lw $s0, 0($sp)        # Restaura $s0 da pilha
    addi $sp, $sp, 8      # Desaloca espa�o da pilha
    jr $ra                # Retorna para a fun��o chamadora
	
	
	
	
	
