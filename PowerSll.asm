.data
RPotencia2: .asciiz "A potencia de 2 elevado a 3 utilizando SLL é: "
.text
.globl main
    
main:

	li $s0, 2   #base 2 sempre
	li $s1, 0   #expoente váriavel (neste caso)
	li $s2, 1   #resultado
	jal Potencia2

	li $v0, 4             
    	la $a0, RPotencia2 	# mensagem potencia
	syscall
    
	li $v0, 1
	move $a0, $s2		#valor da potencia
	syscall
	 
	j exit

	Potencia2:
	subi $s1, $s1, 1
	sllv  $s2, $s0, $s1
	jr $ra
	
	exit:
	li $v0, 10    		#exit	       
	syscall