.section .rodata
	msg_main_print:
	.string "Hello World!!!\n"

.section .text
.globl main
.type main, @function

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $msg_main_print
	call printf
	addl $4, %esp
	
	pushl $0
	call exit

