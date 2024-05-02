.data
 FirstValue: .asciiz "insira o primeiro valor \n" #string para inserir o primeiro valor
 SecondValue: .asciiz "insira o segundo valor \n" #string para inserir o segundo valor
 Op: .asciiz "insira um operação: \n1 - Adição\n2 - Subtração\n3 - Multiplicação\n4 - Divisão\n" #string para inserir o operador
 Resultado: .asciiz "o resultado da operação é: "
 PulaLinha: .asciiz "\n"
 Resto: .asciiz "resto: "
 Erro: .asciiz "ERRO DIVISÃO POR 0\n\n"
 InvalidOperator: .asciiz "Operador inválido, encerrando programa."
.text
.globl main
main:
	li $a1,0
	li $a2,0

	li $v0, 4
   	la $a0, Op
   	syscall
                          # string para selecao de operador,guardar op  e comparar se e invalido
 	li $v0, 5
    	syscall
    	move $s0,$v0
    	
    	bgt $s0,4,InvalidOp
    	blt $s0,1,InvalidOp    	
    	
    	
    	
    	 li $v0, 4
   	 la $a0, FirstValue  # string para primeiro valor e guardar o primeiro valor em um registrador
    	syscall
    
 	li $v0, 5  
    	syscall
    	move $a1, $v0  
    
 	li $v0, 4
    	la $a0, SecondValue
    	syscall
                               #  string para o segundo valor e guardar segundo valor em um registrador
 	li $v0,5
    	syscall
    	move $a2, $v0
    	
    	bne $s0, 1, CompareSub   
    	 jal Soma                                 # ve se e uma soma, se nao for vai para comparesub
    	 j Printa
    	 
    	CompareSub:
    	 bne $s0,2,CompareMulti
    	  jal Sub                                  # ve se e uma subtracao, se nao for vai para CompareMulti
    	 j Printa
    	 
    	CompareMulti:
    	 bne $s0, 3,CompareDiv
    	  jal Multi                              # ve se e uma multiplicacao, se nao for  vai para CompareDiv
    	  j Printa
    	  
    	CompareDiv:
    	 bne $s0,4, InvalidOp                     # ve se e uma divisao, se nao for vai para InvalidOp
    	  jal Div
    	  j Printa
    	 
    	InvalidOp:
    	 li $v0, 4
   	la $a0, InvalidOperator           # se o operador for invalido, printa a mensagem de invalido e encerra
   	syscall
   	j Exit
   	
   	Soma:
   	 add $s1, $a1, $a2		# funcao de soma
    	 jr $ra
   	 
   	Sub:
   	 sub $s1, $a1,$a2		# funcao de subtracao
   	 jr $ra
   	 
   	 Multi:
   	 mult $a1, $a2
    	mflo $s1
    	jr $ra
    	
    	Div:
    	beqz $a2, erro
    
    	div $a1, $a2
    	mflo $s1
    	mfhi $s2
    	jr $ra
   	
   	Printa:
   	li $v0, 4
    	la $a0, Resultado
    	syscall
   
    	li $v0, 1
    	move $a0, $s1
    	syscall
    
    	li $v0, 4
    	la $a0, PulaLinha
    	syscall
    
    	li $v0, 4
    	la $a0, PulaLinha
    	syscall
    	
    	beqz $s2,Exit
    	 li $v0, 4
    	la $a0, Resto
    	syscall
   
    	li $v0, 1
    	move $a0, $s2
    	syscall
    	
    	j Exit
    	
    	erro:
   	li $v0, 4
    	la $a0, Erro
    	syscall
   	j Exit
    	
        Exit:
    	li $v0, 10
    	syscall
    	 
    	 
    	 
    	 
     
    	 
    	     	
