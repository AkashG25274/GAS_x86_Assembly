.section .rodata
	
	msg_main_print1:
	.string	"Enter two numbers:\t"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print2:
	.string	"In main, %d %d %d\n"
	
.section .data
	
	.globl	iNo1
	.type	iNo1, @object
	.size	iNo1, 4
	.align	4
	
	iNo1:
	.int	10
	
.section .bss

	.comm	iNo2, 4, 4
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	pushl	$msg_main_print1
	call 	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	movl	$iNo2, %edx
	pushl	%eax
	pushl	%edx
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	movl	-4(%ebp), %eax
	movl	iNo2, %edx
	movl	iNo1, %ecx
	pushl	%eax
	pushl	%edx
	pushl	%ecx
	pushl	$msg_main_print2
	call	printf
	addl	$16, %esp
	
	call	fun1
	
	pushl	$0
	call	exit

