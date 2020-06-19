.data

	msg: .asciiz "enter a number:"
	star: .asciiz "*"
	nl: .asciiz "\n"

.text

	main:
	
		li $v0,4
		la $a0,msg    
		syscall           #print msg
	
		li,$v0,5
		syscall           #take input
	
		move,$t0,$v0      
		syscall           #store input in t0
	
		li,$s0,0          
		syscall  
	
	loop:
		bne,$s0,$t0,label1
	        
	  a:    addi,$t0,$t0,1
	        syscall

		li $v0,4
		la $a0,nl    
		syscall 
		
		bne,$s0,$t0,label2
		j a
		syscall
		
		
	label1:
		li $v0,4
		la $a0,star    
		syscall 
		
		addi,$s0,$s0,1
		syscall
		
		j loop
		syscall 
		
	label2:
		li $v0,4
		la $a0,star    
		syscall 
		
		addi,$s0,$s0,1
		syscall
		
		j loop
		syscall
		
		
	la $v0, 10		# Exit the program
	syscall