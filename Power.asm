.data
 RPotencia: .asciiz "O resultado da potencia de 2 e 3 eh:"
.text
.globl main
    
main:
	li $s0, 2     #a
	li $s1, 3     #b
	li $s2, 1     #res
	
	jal Potencia

	li $v0, 4             
    	la $a0, RPotencia 	# mensagem potencia
	syscall
    
	li $v0, 1
	move $a0, $s2		#valor da potencia
	syscall
	 
	j exit

	Potencia:
	li  $t0, 0
	loop:
	beq $t0, $s1, exitLoop	#looping da potecia para multiplicar
	mul $s2, $s2, $s0
	addi $t0, $t0, 1
	j loop
	
	exitLoop:
	jr $ra

	exit:
	li $v0, 10    		#exit	       
	syscall
