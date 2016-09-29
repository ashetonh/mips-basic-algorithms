# Problem 3
# Asheton Harrell


.data
promptInteger:	.asciiz "\nEnter an integer: "
promptNumInts:	.asciiz "Please enter number of integers: "
msg1:		.asciiz "\nThe sum of these "
msg2:	   	.asciiz " integers is "
msg3:		.asciiz "\nThe minimum is: "
msg4:		.asciiz "\nThe maximum is: "
.text
.globl main

main:
	la $a0, promptNumInts # print numInts
	li $v0, 4
	syscall

	li $v0, 5 #get user input
	syscall
	
	move $t0, $v0 #t0 = v0 = user inputted ints 
	move $a0, $t0
	li $v0, 1
	syscall

	beq $t0, $zero, done #if userinputs 0 then end program.
	
	la $a0, promptInteger # prompt for integers
	li $v0, 4
	syscall
	
	li $v0, 5 #read input
	syscall
	
	move $t3, $v0 #print the integer we just entered
	move $a0, $t3
	li $v0, 1
	syscall

	move $t4, $t3 #min
	move $t5, $t3 #max

	li $t1, 1 #counter
	li $t2, 0 #sum
	add $t2, $t3, $zero
loop:
	beq $t1, $t0, done # if at end quit
	#beq $t1, $zero, firstIter 

	la $a0, promptInteger # prompt for integers
	li $v0, 4
	syscall

	li $v0, 5 #read input
	syscall
	
	move $t3, $v0 #print the integer we just entered
	move $a0, $t3
	li $v0, 1
	syscall
	
	#blt $t3, $t4, less_than 
	#bgt $t3, $t5, greater_than
	
	add $t2, $t2, $t3 # t3 = sum
	addi $t1, $t1, 1 #increment counter

	blt $t3, $t4, less_than # go to less_than flag
	bgt $t3, $t5, greater_than # go to greater_than flag

	j loop
less_than:
	move $t4, $t3 # t4 = t3 = min
	j loop
greater_than:
	move $t5, $t3 # t5 = t4 = max
	j loop
done:
	la $a0, msg1 #print sum of the number of integers
	li $v0, 4
	syscall

	move $a0, $t0 #print actual number of integers
	li $v0, 1
	syscall

	la $a0, msg2 # integers is
	li $v0, 4
	syscall

	move $a0, $t2 # print actual sum
	li $v0, 1
	syscall

	la $a0, msg3 # Print min
	li $v0, 4
	syscall
	
	move $a0, $t4 # Print actual min number
	li $v0, 1
	syscall

        la $a0, msg4 # Print Max
	li $v0, 4
	syscall

	move $a0, $t5 #Print actual max
	li $v0, 1
	syscall
	

	li $v0, 10 #end program
	syscall