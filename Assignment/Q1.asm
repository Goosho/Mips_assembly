.data
	prompt: .asciiz "Enter the Number : "
	secondstr: .asciiz "The larger number : "
	array: .space 12
.text

main: # Firstly print out the prompt string
	la $s0,1
	
	la $a0, prompt
	li $v0, 4 # To print strings on Terminal line 
	syscall
	
	li $v0,5 # To take input “integer” from user
	syscall # integer input is stored automatically in v0 register
	move $t0,$v0 # Saving as copy of $v0 for later use
	
	li $v0,5 # To take input “integer” from user
	syscall # integer input is stored automatically in v0 register
	move $t1,$v0 # Saving as copy of $v0 for later use
	
	li $v0,5 # To take input “integer” from user
	syscall # integer input is stored automatically in v0 register
	move $t2,$v0 # Saving as copy of $v0 for later use
	
		
	
	sgt  $t8,$t0,$t1  # boolean return t0>t1 into t8
		bne $t8,$s0,label1 #if(t8!=s0) then next line
			move $t3,$t0
			jal next1
	label1:	move $t3,$t1
	
	next1:
	sgt $t7,$t2,$t3 # boolean return t2>t3 into t7
		bne $t7,$s0,label2  #if(t7!=s0) then next line
			move $t3,$t2
			jal next2
	label2:	move $t3,$t3
	
	next2:
	# Printing back what you have given as input
	la $a0, secondstr
	li $v0, 4 # To print strings on Terminal line
	syscall
	
	li $v0,1 # To write output “integer” on Terminal line
	move $a0,$t3 # The integer to be print needs to be in a0 register only
	syscall
