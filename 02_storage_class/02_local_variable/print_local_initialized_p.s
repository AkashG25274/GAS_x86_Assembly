.section .rodata

	msg_main_print:
	.string "iNo is %d\n"
	
.section .text

.globl main
.type main, @function

main:
	pushl %ebp
	movl %esp, %ebp
	
	subl $4, %esp
	
	movl $50, -4(%ebp)
	
	movl -4(%ebp), %eax
	pushl %eax
	pushl $msg_main_print
	call printf
	addl $8, %esp
	
	pushl $0
	call exit
