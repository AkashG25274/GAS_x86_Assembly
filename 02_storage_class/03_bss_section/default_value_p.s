.section .rodata
	
	msg_main_print:
	.string "Number is %d\n"
	
.section .bss

	.comm g_iNo, 4, 4
	
.section .text

.globl main
.type main, @function

main:
	pushl %ebp
	movl %esp, %ebp
	
	movl g_iNo, %eax
	pushl %eax
	pushl $msg_main_print
	call printf
	addl $8, %esp
	
	pushl $0
	call exit
