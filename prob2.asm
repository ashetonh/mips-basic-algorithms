## Problem 2: Replacing character in string
## Author: Asheton Harrell

.data
string:	        .space 80
character:	.space 4
replChar:	.space 4
promptString:	.asciiz "Please enter a string here(Max 80 characters): "
promptChar:	.asciiz "\nPlease enter a character to be replaced: \n"
promptReplCh:	.asciiz "\nPlease enter a replacement character. "
msg1:		.asciiz "\nOriginal String:  "
msg2:		.asciiz "\nSubstitute  "
msg3:		.asciiz " with "
msg4:	 	.asciiz "\nResulting String: "
	
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
	move $t1, $a0
	syscall

	la $a0, promptReplCh # print prompt for replacement char
	li $v0, 4
	syscall

	li $v0, 8 #read input again
	la $a0, replChar
	move $t5, $a0
	syscall

	la $a0, msg1 # Original string
	li $v0, 4
	syscall

	la $a0, string # Print original string
	li $v0, 4
	syscall	

	li $t2, 0 # counter
loop:
	lbu $t3, 0($t0) #single character of string
	lbu $t4, 0($t1) #single character of character
	beq $t3, $zero, done #if string == null term char then end program.
	beq $t3, $t4, true #if statement for if you 
	bne $t3, $t4, false
	

true:
	lbu $t6, 0($t5) #load replacement character
	sb $t6, string($t2) # actually move replacement char into string at counter index
	addi $t2, $t2, 1 #increment counter
	addi $t0, $t0, 1 #moves on to next char in string
	j loop

false:
	addi $t2, $t2, 1 # counter
	addi $t0, $t0, 1 #moves on to next char in string
	j loop
	
done:	
	la $a0, msg2 # Substitute
	li $v0, 4
	syscall
	
	la $a0, character # Print saved string
	li $v0, 4
	syscall

	la $a0, msg3 # with
	li $v0, 4
	syscall
	
	la $a0, replChar  #replacement character
	li $v0, 4
	syscall
	
	la $a0, msg4 # resulting string
	li $v0, 4
	syscall

	la $a0, string
	li $v0, 4
	syscall

	li $v0, 10
	syscall