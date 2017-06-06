# ./Formals.s
# Source file: Formals.java
# Compiled: Tue May 09 15:47:17 EDT 2017

.text

main:
    subu    $sp,$sp,16 	 # Stack frame is 16 bytes long
    sw      $ra,12($sp) 	 # Save return address
    sw      $fp,8($sp) 	 # Save frame pointer
    addiu   $fp,$sp,12 	 # Save frame pointer

main.0:

main.1:
    li null,1
    li null,2
    li null,3
    li null,4
    li null,5
    li null,6
    move null,$a0
    move $a0,null
    move null,$a1
    move $a1,null
    move null,$a2
    move $a2,null
    move null,$a3
    move $a3,null
    sw null,0($sp)
    sw null,4($sp)
    jal Formals.sum
    move null,$v0
    move $a0,null
    move $a1,null
    move $a2,null
    move $a3,null
    move null,$a0
    move $a0,null
    jal spim.SPIM.printInt
    move $a0,null
    li null,10
    move null,$a0
    move $a0,null
    jal spim.SPIM.printChar
    move $a0,null
    li null,1
    li null,2
    li null,3
    li null,4
    li null,5
    li null,6
    move null,$a0
    move $a0,null
    move null,$a1
    move $a1,null
    move null,$a2
    move $a2,null
    move null,$a3
    move $a3,null
    sw null,0($sp)
    sw null,4($sp)
    jal Formals.product
    move null,$v0
    move $a0,null
    move $a1,null
    move $a2,null
    move $a3,null
    move null,$a0
    move $a0,null
    jal spim.SPIM.printInt
    move $a0,null
    li null,10
    move null,$a0
    move $a0,null
    jal spim.SPIM.printChar
    move $a0,null
    j main.restore

main.restore:
    lw      $ra,12($sp) 	 # Restore return address
    lw      $fp,8($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,16 	 # Pop stack
    jr      $ra 	 # Return to caller



.text

Formals.sum:
    subu    $sp,$sp,8 	 # Stack frame is 8 bytes long
    sw      $ra,4($sp) 	 # Save return address
    sw      $fp,0($sp) 	 # Save frame pointer
    addiu   $fp,$sp,4 	 # Save frame pointer

Formals.sum.0:

Formals.sum.1:
    li null,7
    add null,$a0,$a1
    add null,null,$a2
    add null,null,$a3
    add null,null,null
    add null,null,null
    add null,null,null
    move $v0,null
    j Formals.sum.restore

Formals.sum.restore:
    lw      $ra,4($sp) 	 # Restore return address
    lw      $fp,0($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,8 	 # Pop stack
    jr      $ra 	 # Return to caller



.text

Formals.product:
    subu    $sp,$sp,8 	 # Stack frame is 8 bytes long
    sw      $ra,4($sp) 	 # Save return address
    sw      $fp,0($sp) 	 # Save frame pointer
    addiu   $fp,$sp,4 	 # Save frame pointer

Formals.product.0:

Formals.product.1:
    li null,7
    mul null,$a0,$a1
    mul null,null,$a2
    mul null,null,$a3
    mul null,null,null
    mul null,null,null
    mul null,null,null
    move $v0,null
    j Formals.product.restore

Formals.product.restore:
    lw      $ra,4($sp) 	 # Restore return address
    lw      $fp,0($sp) 	 # Restore frame pointer
    addiu   $sp,$sp,8 	 # Pop stack
    jr      $ra 	 # Return to caller



# SPIM Runtime

# Copyright 2013 Bill Campbell, Swami Iyer and Bahar Akbal-Delibas

# SPIM.s 

.text

# Print the integer value passed as parameter.

spim.SPIM.printInt:

    subu $sp,$sp,32     # Stack frame is 32 bytes long
    sw $fp,28($sp)      # Save frame pointer
    addu $fp,$sp,3      # Set up frame pointer

    li $v0,1            # Syscall code to print an integer
    syscall	        # Prints the arg value

    lw $fp,28($sp)      # Restore frame pointer
    addiu $sp,$sp,32    # Restore the stack pointer
    jr $ra              # Return to caller

# Print the float value passed as parameter.

spim.SPIM.printFloat:

    subu $sp,$sp,32     # Stack frame is 32 bytes long
    sw $fp,28($sp)      # Save frame pointer
    addu $fp,$sp,32     # Set up frame pointer

    li $v0,2            # Syscall code to print a float
    syscall             # Prints the arg value

    lw $fp,28($sp)      # Restore frame pointer
    addiu $sp,$sp,32    # Restore the stack pointer
    jr $ra              # Return to caller

# Print the double value passed as parameter.
	
spim.SPIM.printDouble:
    subu $sp,$sp,32    # Stack frame is 32 bytes long
    sw $fp,28($sp)     # Save frame pointer
    addu $fp,$sp,32    # Set up frame pointer

    li $v0,3           # Syscall code to print a double
    syscall            # Prints the arg value

    lw $fp,28($sp)     # Restore frame pointer
    addiu $sp,$sp,32   # restore the stack pointer
    jr $ra             # Return to caller

# Print the string value passed as parameter.

spim.SPIM.printString:
    subu $sp,$sp,32    # Stack frame is 32 bytes long
    sw $fp,28($sp)     # Save frame pointer
    addu $fp,$sp,32    # Set up frame pointer

    li $v0,4           # Syscall code to print a string
    syscall            # Print the string value

    lw $fp,28($sp)     # Restore frame pointer
    addiu $sp,$sp,32   # Restore the stack pointer
    jr $ra             # Return to caller

# Print the char value passed as parameter.

spim.SPIM.printChar:
	subu $sp,$sp,32	   # Stack frame is 32 bytes long
	sw $fp,28($sp)     # Save frame pointer
	addu $fp,$sp,32    # Set up frame pointer


	li $v0,11          # Syscall code to print a char
	syscall            # Print the char value

	lw $fp,28($sp)     # Restore frame pointer
	addiu $sp,$sp,32   # Restore the stack pointer
	jr $ra             # Return to caller

# Read the integer value from the user through console.

spim.SPIM.readInt:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,5                # Syscall code to read an integer
	syscall                 # Load the integer value read from console into $v0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Read the float value from the user through console.
	
spim.SPIM.readFloat:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,6                # Syscall code to read a float
	syscall	                # Load the float value read from console into $f0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Read the double value from the user through console.

spim.SPIM.readDouble:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,7                # Syscall code to read a double
	syscall	                # Load the float value read from console into $f0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller
   
# Read the string value from the user through console.

spim.SPIM.readString:
	subu $sp,$sp,32		# Stack frame is 32 bytes long
	sw $fp,28($sp)		# Save frame pointer
	addu $fp,$sp,32		# Set up frame pointer

	li $v0,8		# Syscall code to read a string
	syscall			# Load the string value; $a0 = buffer, $a1 = length

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32	# Restore the stack pointer
	jr $ra 			# Return to caller

# Read the char value from the user through console.

spim.SPIM.readChar:
	subu $sp,$sp,32	        # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32	        # Set up frame pointer

	li $v0,12               # Syscall code to read a char
	syscall	                # Load the char value read from console into $a0

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller
	
# Opens a file. This operation uses two arguments:
# $a0 = the address of the file name to open
# $a1 = flags  (0: read only, 1: write only, 2: read and write, 
#               100: create file, 8: append data)
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.open:
	subu $sp,$sp,32         # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,13       	# System call code for open file
  	syscall          	# Open a file (file descriptor returned in $v0)

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Reads from a file. This operation uses three arguments:
# $a0 = file descriptor
# $a1 = the address of input buffer
# $a2 = the length of bytes to read
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.read:
	subu $sp,$sp,32         # Stack frame is 32 bytes long
	sw $fp,28($sp)          # Save frame pointer
	addu $fp,$sp,32         # Set up frame pointer

	li $v0,14               # System call code for read file
  	syscall                 # Read from file ($a0 contains file descriptor, $v0 contains 
  	                        # number of character read)

	lw $fp,28($sp)          # Restore frame pointer
	addiu $sp,$sp,32        # Restore the stack pointer
	jr $ra                  # Return to caller

# Writes to a file. This operation uses three arguments:
# $a0 = file descriptor
# $a1 = the address of output buffer
# $a2 = the length of bytes to write
# These registers are assumed to be set by the caller before calling this procedure

spim.SPIM.write:
	subu $sp,$sp,32     # Stack frame is 32 bytes long
	sw $fp,28($sp)      # Save frame pointer
	addu $fp,$sp,32     # Set up frame pointer

 	li $v0,15           # System call for write to file
  	syscall             # Write to file  ($a0 contains file descriptor)

	lw $fp,28($sp)      # Restore frame pointer
	addiu $sp,$sp,32    # Restore the stack pointer
	jr $ra              # Return to caller

# Close a file ($a0 contains file descriptor).

spim.SPIM.close:
	subu $sp,$sp,32	    # Stack frame is 32 bytes long
	sw $fp,28($sp)      # Save frame pointer
	addu $fp,$sp,32     # Set up frame pointer

	li $v0,16           # System call code for close
  	syscall		    # Close file

	lw $fp,28($sp) 	    # Restore frame pointer
	addiu $sp,$sp,32    # Restore the stack pointer
	jr $ra              # Return to caller

# Exit SPIM.
	
spim.SPIM.exit:
    li $v0,10        # Syscall code to exit
    syscall

# Exit SPIM with a specified code (in $a0).
	
spim.SPIM.exit2:
    li $v0,17        # Syscall code to exit2
    syscall
	
