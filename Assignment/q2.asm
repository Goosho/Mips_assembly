.data
	ans:	.asciiz	" is : "
	time: .asciiz "times "
	line: .asciiz "\n"
	teststring:	.asciiz	
	
	promptstring: 	.asciiz " Please enter a sentence :  " 	
	array:		.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	array1: 	.asciiz "abcdefghijklmnopqrstuvwxyz"
.text
main:
	li $s0,97
	li $s1,123
	la $t2,array
	li $t3,0
	li $t4,26
					# Firstly print out the string
	la $a0, promptstring
	li $v0, 4			# To print strings on Terminal line
	syscall
	
	
	la $a0,teststring		# entered string in teststring
	la $a1,500
	li $v0,8
	syscall	
	
loopbegin:	
	beq,$s0,$s1,exit
	
	lb $t1, teststring($t0)		# Get the character at that position
	beqz $t1, exit		# if string is finished terminate loop
	subi $k0,$t1,97
	sll $t8,$k0,2
	li $t9,0
	
	
	lw $t9,array($t8)
	addi $t9,$t9,1
	sw $t9,array($t8)
	addi $s0,$s0,1
	addi $t0,$t0,1
	j loopbegin
	exit:
	li $s0,97
	li $s1,123
	li $t3,97
	li $t5,0
	li $t4,123

printloop:	
	beq $t3,$t4,exit3
	
	lw $s0,array($t5)
	beqz $s0,skip


	move $a0,$t3
	li $v0,11
	syscall
	
	la $a0, ans
	li $v0, 4			# To print strings on Terminal line
	syscall
	
	
	li $v0,1
	add $a0,$s0,$zero
	syscall
		
	
	
	la $a0, time
	li $v0, 4			# To print strings on Terminal line
	syscall
	
	
	la $a0, line
	li $v0, 4			# To print strings on Terminal line
	syscall
	
skip:	addi $t5,$t5,4
	addi $t3,$t3,1
	
	
	j printloop
	
	
	exit3:
	
