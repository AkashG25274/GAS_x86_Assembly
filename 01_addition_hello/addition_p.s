.section .rodata
	msg_main_printf1:
	.string "Enter two numbers:"
	
	msg_main_scanf:
	.string "%d%d"
	
	msg_main_printf2:
	.string "Answer is:%d\n"
	
.section .text
.globl 	main
.type 	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$12, %esp
	
	pushl	$msg_main_printf1
	call	printf
	addl	$4, %esp
	
	leal	-8(%ebp), %eax
	leal	-4(%ebp), %edx	
	pushl	%eax
	pushl	%edx
	pushl	$msg_main_scanf
	call	scanf
	addl	$12, %esp
	
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	pushl	%eax
	pushl	%edx
	call 	addition
	addl 	$8, %esp
	
	pushl	%eax
	pushl	$msg_main_printf2
	call	printf
	addl	$8, %esp
	
	pushl	$0
	call	exit
	
.globl	addition
.type	addition, @function

addition:
	pushl	%ebp
	movl	%esp, %ebp
	
	addl	%edx, %eax
	
	movl	%ebp, %esp
	popl	%ebp	
	ret

