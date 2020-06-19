.data
	mychar: .byte 'm'
	
.text
	li $v0,4
	la $a0, mychar
	syscall