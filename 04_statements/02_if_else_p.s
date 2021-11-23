.section .data
	
	msg_main_print:
	.string	"Enter Number:\n"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_even:
	.string	"Number is even\n"
	
	msg_main_print_odd:
	.string	"Number is odd\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	xorl	%edx, %edx
	
	movl	-4(%ebp), %eax
	movl	$2, %ecx
	
	div	%ecx
	
	cmpl	$0, %edx
	
	jne	label_main_else
	
	pushl	$msg_main_print_even
	call	printf
	addl	$4, %esp
	
	jmp	label_main_exit
			
label_main_else:
	
	pushl	$msg_main_print_odd
	call	printf
	addl	$4, %esp
	
label_main_exit:
	
	pushl	$0
	call	exit

