.data
RPotencia2: .asciiz "A potencia de 2 elevado ao expoente escolhido eh: "
Exp: .asciiz "Aa qual expoente 2 será elevado? "
Pula: .asciiz "\n"
.text
.globl main
    
main:

	li $s0, 2   #base 2 sempre
	li $s1, 0   # Expoente que o usuario ira colocar por entrada de dados
	li $s2, 1   #resultado
	
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
	 
	j exit

	exitzero:
	li $s2, 1
	jr $ra
	
	Potencia2:
	beqz $s1,exitzero
	subi $s1, $s1, 1                #Para a potencia funcionar corretamente com o SLL, $s1 deve ser subtraido em uma unidade
	sllv  $s2, $s0, $s1
	jr $ra

	exit:
	li $v0, 10    		#fechar o programa
	syscall
