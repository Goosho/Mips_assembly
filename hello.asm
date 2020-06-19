.data
	mymsg: .asciiz "Hello \n"

.text
	li $v0, 4
	la $a0, mymsg
	syscall 