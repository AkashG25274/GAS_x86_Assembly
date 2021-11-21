.section .rodata

	msg_fun1_print1:
	.string	"Enter Number:\t"
	
	msg_fun1_scan:
	.string	"%d"
	
	msg_fun1_print2:
	.string	"In fun, iNo1 is %d & iNo2 is %d\n"
	
	msg_fun2_print:
	.string	"In static fun2\n"
	
.section .data

	.type 	iNo2, @object
	.size	iNo2, 4
	.align	4
	
	iNo2:
	.int	40
	
.section .bss

	.lcomm	iNo1, 4
	
.section .text

.globl	fun1
.type	fun1, @function

fun1:
	pushl	%ebp
	movl	%esp, %ebp
	
	pushl	$msg_fun1_print1
	call	printf
	addl	$4, %esp
	
	movl	$iNo1, %ebx
	pushl	%ebx
	pushl	$msg_fun1_scan
	call	scanf
	addl	$8, %esp
	
	movl	iNo2, %eax
	movl	iNo1, %edx
	pushl	%eax
	pushl	%edx
	pushl	$msg_fun1_print2
	call	printf
	addl	$12, %esp
	
	call fun2
	
	pop %ebp
	
	ret

.type	fun2, @function

fun2:
	pushl	%ebp
	movl	%esp, %ebp
	
	push	$msg_fun2_print
	call	printf
	addl	$4, %esp
	
	pop	%ebp
	
	ret

