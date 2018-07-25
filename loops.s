main:
add $16, $0, $0 			# $16 = 0 / int in = 0
addi $17, $0, 25 		# $17 = 25
addi $23, $0, 1 		# $23 = 1
addi $24, $0, 2			# $24 = 2

whileloop:
	beq $16, $17, exit
	add $18, $0, $0 			# bool out = 0
	add $19, $0, $0 			# int s = 0
	addi $20, $0, 32 		# store 32
	add $21, $0, $0 			# int i = 0
forloop:
	beq $21, $20, endcond 	# if i = 32, go to whileloop
	srav $22, $16, $21		# $22 = bool bit = (in >> i)
	addi $21, $21, 1
	andi $22, $22, 1 		# bit & 1  

	bne $19, $0, elseif1 	# s==0
	bne $22, $23, elseif1	# bit==1
	addi $19, $0, 1			# s = 1
	j forloop

elseif1:
	bne $19, $23, elseif2	
	bne $22, $23, elseif2	
	addi $19, $19, 1			# s = 2
	addi $18, $0, 1			# out = 1
	j forloop
elseif2:
	bne $19, $24, forloop
	bne $22, $23, forloop
	addi $19, $0, 1			# s = 1
	add $18, $0, $0			# out = 0
	j forloop

endcond:
	addi $16, $16, 1			# ++in
	add $4, $18, $0
	addi $2, $0, 1			# get ready to print
	syscall
	addi $4, $0, 10
	addi $2, $0, 11
	syscall
	j whileloop				# end of while loop

exit:
	addi $2, $0, 10			#exit
	syscall	