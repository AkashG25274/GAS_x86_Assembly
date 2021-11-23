.section .rodata

	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print_division:
	.string	"Division: Qoutient is %d\nRemainder is %d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax		#iNo1 address
	leal	-8(%ebp), %edx		#iNo2 address
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	xorl	%edx, %edx
	
	movl	-4(%ebp), %eax		#iNo1
	movl	-8(%ebp), %ecx		#iNo2
	
	cltd
	idivl	%ecx
	
	pushl	%edx			#Remainder
	pushl	%eax			#Quotient
	pushl	$msg_main_print_division
	call	printf
	addl	$12, %esp
	
	pushl	$0
	call	exit

