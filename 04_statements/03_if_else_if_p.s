.section .rodata

	msg_main_print:
	.string	"Enter Number:\n"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_less_than_2:
	.string	"Number is less than 2\n"
	
	msg_main_print_greater_than_2:
	.string	"Number is greater than 2\n"
	
	msg_main_print_number_2:
	.string	"Number is 2\n"
	
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
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	-4(%ebp), %eax
	
	cmpl	$2, %eax
	
	jl	label_main_less_than
	jg	label_main_greater_than
	
	pushl	$msg_main_print_number_2
	call	printf
	addl	$4, %esp
	
	jmp	label_main_exit
	
label_main_less_than:
	
	pushl	$msg_main_print_less_than_2
	call	printf
	addl	$4, %esp
	
	jmp	label_main_exit
	
label_main_greater_than:
	
	pushl	$msg_main_print_greater_than_2
	call	printf
	addl	$4, %esp
	
label_main_exit:

	pushl	$0
	call	exit

