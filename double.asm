.data

	mydou: .double 7.202
	zerodou: .double 0.10

.text

	ldc1 $f2, mydou
	ldc1 $f0, zerodou
	
	li $v0, 3
	add.d $f12,$f2,$f0
	syscall