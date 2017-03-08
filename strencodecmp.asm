# Tanner Kvarfordt
# A02052217

### Assignment Description ###

# Write a procedure called strencodecmp that takes two input parameters (a0, a1 respectively)
# that are pointers to two strings (string0 and string1). The encoding is rather dumb
# (for sake of simplicity): add one to every character so that 'a' becomes 'b' and 'g' becomes
# 'h', 'J' becomes 'K'. Special case when you get to the end of the alphabet: 'z' becomes 'a'
# and 'Z' becomes 'A'.  Assume the string contains only alphabetic characters (ie no numbers,
# no spaces, nor special characters). If you use the '.asiiz' type, the string will be null
# terminated (end with 0x00). Use the announcement about mars which has the sample hello world
# program, the announcement from class where we did a sample print procedure, or the solution
# to the sorting algorithm as a starting point and for code snippets as you want.
# 
# So, the procedure will encode string0; compare the resulting encoded string to string1; return
# in v0 the value of 0 (ZERO) if they are the same; return in v0 any other value (non-zero) if
# they are different. It is common for programs to return 0 if successfully finished as designed. 
# 
# You need to turn in your assembly code (.asm file) which contains your procedure as well as
# structure that sets up the strings, calls the procedure and so forth. You will need all the
# surrounding assembly to test and verify that your procedure functions properly anyway. 


### Reminders ###
	# chars are 1 byte
	# MIPS has 32 bit registers
	# addresses jump by 32 bytes
	
### Data Declaration Section ###
.data
string0: .asciiz "XYZ" # Play with this string and string1 to change the output results

.align 2 # The '.align n' directive is a way to override the default alignment rules. 
	 # The next field after the directive will be aligned to a multiple of 2 to the power of n where n is the .align value.
	 # In this case, we'll align to 2^2, or four. This ensures we're aligned on a word
	 
string1: .asciiz "YZA" # Play with this string and string0 to change the output results

.align 2
msg0: .asciiz "v0 = 0, string0 == string1 is true\n"

.align 2
msg1: .asciiz "v0 = 1, string0 == strint1 is false\n"

### Code Section ###
.text
	
	### Main Program ###
	
	main:
		la $a0, string0
		la $a1, string1
		jal strencodecmp	# jal says jump to the label and save the program counter to $ra	
		beq $v0, 1, false
		
	true:	
		li $v0, 4		# load system instruction 4 (print string) into v0 register
		la $a0, msg0		# load message to be printed into a0
		syscall
		j exit
	false:
		li $v0, 4		# load system instruction 4 (print string) into v0 register
		la $a0, msg1		# load message to be printed into a0
		syscall
	exit:
		li $v0, 10         	# load system instruction 10 (terminate program) into v0 register
    		syscall
    
 
 	### Procedures ###
 	
 	strencodecmp:
 		lb   $t1, 0($a0)		# t1 = first character of string0
 		move $t9, $a0			# copy a0 to t9 to preserve a0
 	    loop:
 	    	seq  $t2, $t1, 0x00		# check if t1 is a null terminator
 	    	beq  $t2, 1, compare
 	        seq  $t2, $t1, 0x7A  		# check if t1 is 'z'
 	        beq  $t2, 1, isLittleZ
 	        seq  $t2, $t1, 0x5A		# check if t1 is 'Z'
 	        bne  $t2, 1, notZ 
 	    isBigZ: # if t1 is 'Z'
 	    	ori  $t1, $0, 0x41		# set t1 = 'A'
 	    	sb   $t1, 0($t9)		# store the incremented char back to memory
 	        j    nextChar
 	    # end if 	
 	    isLittleZ: # if t1 is 'z'
 	    	ori  $t1, $0, 0x61		# set t1 = 'a'
 	    	sb   $t1, 0($t9)
 	    	j    nextChar
 	    # end if
 	    notZ: # else t1 is not 'Z' or 'z'	
 		addi $t1, $t1, 1		# increment t1 to be the next ascii character
 		sb   $t1, 0($t9)		# store the incremented char back to memory
 	    # end else	
 	    nextChar:
 		addi $t9, $t9, 1		# increment a0 by one to get the address of the next character
 		lb   $t1, 0($t9)		# get the next char
 		j    loop
 	    compare:
 	        lw   $t0, 0($a1)		# set t0 = string1
 	        lw   $t1, 0($a0)		# set t1 = string0
 	        seq  $t2, $t0, $t1		# compare string1 and string0 to see if they are equal
 	        beq  $t2, 1, equal
 	    notEqual:
		ori  $v0, $0, 1			# if string1 and string0 are not equal, return 1
 	        j    return
 	    equal:
 	        ori  $v0, $0, 0			# if string1 and string0 are equal, return 0
 	    return:
 		jr   $ra
