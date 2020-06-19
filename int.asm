.data
	age: .word 23 # tHIS is word 
.text

	li $v0, 1
	lw $a0, age
	syscall
	