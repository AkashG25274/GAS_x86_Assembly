.section .rodata

	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print_multiplication:
	.string	"Result of Multiplication is %d\n"
	
	msg_main_print_division:
	.string	"Result of Division:\nQuotient:%d\nRemainder:%d\n"
	
.section .text

.globl	main
.type 	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	################## Muliplication Operation ########################
	
	movl	-4(%ebp), %eax	#Operand1
	movl	-8(%ebp), %ecx	#Operand2
	
	mull	%ecx
	
	pushl	%eax
	pushl	$msg_main_print_multiplication
	call	printf
	addl	$8, %esp

	################### Division Operation ############################
	
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
			
	movl	-4(%ebp), %eax	#operand1
	movl	-8(%ebp), %ecx	#operand2
	
	idivl	%ecx
	
	pushl	%edx		#Remainder
	pushl	%eax		#Qoutient
	pushl	$msg_main_print_division
	call	printf
	addl	$12, %esp
	
	pushl	$0
	call	exit

