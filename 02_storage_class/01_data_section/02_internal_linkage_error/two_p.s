.section .rodata
	
	msg_fun_print:
	.string "In fun, g_iNo is %d\n"
	
.section .data

	.type g_iNo, @object
	.size g_iNo, 4
	.align 4
	
	g_iNo:
	.int 10
	
.section .text

.globl fun
.type fun, @function

fun:
	pushl %ebp
	movl %esp, %ebp
	
	movl g_iNo, %eax
	pushl %eax
	pushl $msg_fun_print
	call printf
	addl $8, %esp
	
	pop %ebp
	
	ret
