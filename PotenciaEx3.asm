.data
RPotencia2: .asciiz "A potencia de 2 elevado ao expoente escolhido eh: "
Xmul: .asciiz "A qual valor este resultado será multiplicado? "
Exp: .asciiz "A qual expoente 2 será elevado? "
MulRes: .asciiz "X multiplicado pelo resultado de 2 elevado ao expoente eh: "
Pula: .asciiz "\n"
.text
.globl main
    
main:

	li $s0, 2   #base 2 sempre
	li $s1, 0   # Expoente que o usuario ira colocar por entrada de dados
	li $s2, 1   #resultado
	li $s4, 0   # X entrada do úsuario e depois sera usado para guardar o resultado da multiplicacao
	
	li $v0, 4
   	 la $a0, Exp  # string para  receber o expoente do usuario e guardar em um registrador
    	syscall
    
 	li $v0, 5  
    	syscall
    	move  $s1, $v0  
    	
	jal Potencia2
	
	li $v0, 4             
    	la $a0, RPotencia2 	# mensagem potencia
	syscall
    
	li $v0, 1
	move $a0, $s2		#valor da potencia
	syscall
	
	li $v0, 4             
    	la $a0, Pula	# Pula linha
	syscall
	
	li $v0, 4
   	la $a0, Xmul  # string para  receber X do usuario e guardar em um registrador
    	syscall
    
 	li $v0, 5  
    	syscall
    	move  $s4, $v0     # Guardar X em $s4
    	
    	jal Multi
    	
    	li $v0, 4             
    	la $a0, MulRes
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	j exit
	
	Multi:
	mul $s4, $s4, $s2
	jr $ra
	
	Potencia2:
	beqz $s1,exitzero
	subi $s1, $s1, 1                #Para a potencia funcionar corretamente com o SLL, $s1 deve ser subtraido em uma unidade
	sllv  $s2, $s0, $s1
	jr $ra
	
	exitzero:
	li $s2, 1
	jr $ra
	
	exit:
	li $v0, 10    		#fechar o programa
	syscall
