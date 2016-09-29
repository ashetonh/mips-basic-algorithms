## Problem 1: Count number of occurrences of characters
## Author: Asheton Harrell

.data
string:	        .space 80
character:	.space 1
promptString:	.asciiz "Please enter a string here(Max 80 characters): "
promptChar:	.asciiz "\nPlease enter a character: \n"
msg1:		.asciiz "\nCharacter "
msg2:		.asciiz " occurs in string "
msg3:		.asciiz " "
msg4:	 	.asciiz " time(s)."
	
.text		
.globl main
	
main:
	la $a0, promptString #Print prompt for string
	li $v0, 4 
	syscall


	li $v0, 8 #read input
	la $a0, string #load memory
	move $t0, $a0 #save string
	syscall

	la $a0, promptChar #print prompt for char
	li $v0, 4
	syscall

        li $v0, 8 #read input again
	la $a0, character #make sure character is loaded.
	#la $a1, character
	move $t1, $a0
	syscall
		
	la $a0, string #Print saved String
	li $v0, 4
	syscall

	la $a0, character # Print saved character
	li $v0, 4
	syscall

	li $t2, 0 # counter for matches
loop:
	lbu $t3, 0($t0) #single character of string
	lbu $t4, 0($t1) #single character of character
	beq $t3, $zero, done #if string == null term char then end program.
	beq $t3, $t4, true #if statement for if you 
	bne $t3, $t4, false
	

true:
	addi $t2, $t2, 1 #increment counter
	addi $t0, $t0, 1 #moves on to next char in string
	j loop

false:
	addi $t0, $t0, 1 #moves on to next char in string
	j loop
	
done:	
	
	la $a0, msg1 # Character <ch>
	li $v0, 4
	syscall

	la $a0, character # Print saved character
	li $v0, 4
	syscall

	la $a0, msg2 # occurs in string <string>
	li $v0, 4
	syscall
	
	la $a0, string # Print saved string
	li $v0, 4
	syscall

	la $a0, msg3 # empty space
	li $v0, 4
	syscall
	
	move $a0, $t2  #print integer
	li $v0, 1
	syscall
	
	la $a0, msg4 # times
	li $v0, 4
	syscall

	li $v0, 10
	syscall