.data

	prompt: .asciiz "Enter the size of triangle : "
	line: .asciiz "\n"
	star: .asciiz "*"


.text

main:
	la $a0, prompt
	li $v0, 4			# To print strings on Terminal line
	syscall
	
	li $v0,5			# To take input “integer” from user
	syscall				# integer input is stored automatically in v0 register
	move $t0,$v0 			# Saving as copy of $v0 for later use
	move $t1,$t0
jump:	beq $t0,$zero,label
	move $t1,$t0
	jump1:	beq $t1,$zero,label1
			la $a0, star
			li $v0, 4			# To print strings on Terminal line
			syscall
			subi $t1,$t1,1
			j jump1
		label1:	subi $t0,$t0,1
			la $a0, line
			li $v0, 4			# To print strings on Terminal line
			syscall
			j jump
	
label:
	la $v0, 10		# Exit the program
	syscall
	
	
	
	
	
	
	
	