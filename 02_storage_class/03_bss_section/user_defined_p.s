.section .rodata

	msg_main_print1:
	.string "Enter Number:"
	
	msg_main_scan:
	.string "%d"
	
	msg_main_print2:
	.string "Number is %d\n"
	
.section .bss

	.comm g_iNo, 4, 4
	
.section .text

.globl main
.type main, @function

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $msg_main_print1
	call printf
	addl $4, %esp
	
	movl $g_iNo, %ebx
	pushl %ebx
	pushl $msg_main_scan
	call scanf
	addl $8, %esp
	
	movl g_iNo, %eax
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8, %esp
	
	pushl $0
	call exit

