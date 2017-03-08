# MIPS_strencodecmp
An assignment for CS3810. Not particularly useful or interesting, just good practice writing assembly.

 Assignment Description:

 Write a procedure called strencodecmp that takes two input parameters (a0, a1 respectively)
 that are pointers to two strings (string0 and string1). The encoding is rather dumb
 (for sake of simplicity): add one to every character so that 'a' becomes 'b' and 'g' becomes
 'h', 'J' becomes 'K'. Special case when you get to the end of the alphabet: 'z' becomes 'a'
 and 'Z' becomes 'A'.  Assume the string contains only alphabetic characters (ie no numbers,
 no spaces, nor special characters). If you use the '.asciiz' type, the string will be null
 terminated (end with 0x00). Use the announcement about mars which has the sample hello world
 program, the announcement from class where we did a sample print procedure, or the solution
 to the sorting algorithm as a starting point and for code snippets as you want.
 
 So, the procedure will encode string0; compare the resulting encoded string to string1; return
 in v0 the value of 0 (ZERO) if they are the same; return in v0 any other value (non-zero) if
 they are different. It is common for programs to return 0 if successfully finished as designed. 
 
 You need to turn in your assembly code (.asm file) which contains your procedure as well as
 structure that sets up the strings, calls the procedure and so forth. You will need all the
 surrounding assembly to test and verify that your procedure functions properly anyway. 
