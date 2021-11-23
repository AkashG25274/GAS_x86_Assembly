.section .rodata

	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print_and:
	.string	"AND is %d\n"
	
	msg_main_print_or:
	.string	"OR is %d\n"
	
	msg_main_print_xor:
	.string	"XOR is %d\n"
	
	msg_main_print_not:
	.string	"Not of iNo2 is %d\n"
	
	msg_main_print_left_shift:
	.string	"iNo1 << 2 is %d\n"
	
	msg_main_print_right_shift:
	.string	"iNo1 >> 2 is %d\n"
			
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
	pushl	$msg_main_print
	call 	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	############# and operation #####################
	
	movl	-4(%ebp), %eax	#iNo1
	movl	-8(%ebp), %edx	#iNo2
	
	andl	%edx, %eax
	
	pushl	%eax
	pushl	$msg_main_print_and
	call 	printf
	addl	$8, %esp
	
	############# or operation #####################
	
	movl	-4(%ebp), %eax	#iNo1
	movl	-8(%ebp), %edx	#iNo2

	orl	%edx, %eax
	
	pushl	%eax
	pushl	$msg_main_print_or
	call	printf
	addl	$8, %esp
	
	############# xor operation #####################
	
	movl	-4(%ebp), %eax	#iNo1
	movl	-8(%ebp), %edx	#iNo2

	xorl	%edx, %eax
	
	pushl	%eax
	pushl	$msg_main_print_xor
	call	printf
	addl	$8, %esp
	
	############# not operation #####################
	
	movl	-8(%ebp), %eax	#iNo2

	notl	%eax
	
	pushl	%eax
	pushl	$msg_main_print_not
	call	printf
	addl	$8, %esp
	
	############# left shift operation #####################
	
	movl	-4(%ebp), %eax	#iNo1
	
	sall	$2, %eax
	
	pushl	%eax
	pushl	$msg_main_print_left_shift
	call	printf
	addl	$8, %esp
			
	############# right shift operation #####################
	
	movl	-4(%ebp), %eax	#iNo1

	sarl	$2, %eax
	
	pushl	%eax
	pushl	$msg_main_print_right_shift
	call	printf
	addl	$8, %esp

	############# exit ######################################
	
	pushl	$0
	call	exit

