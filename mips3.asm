.data
	prompt: .asciiz "Enter the Number : "
	
	
.text

	la $a0, prompt
	li $v0, 4 # To print strings on Terminal line 
	syscall

	li $v0,5 # To take input “integer” from user
	syscall # integer input is stored automatically in v0 register
	move $t0,$v0 # Saving as copy of $v0 for later use
	
	