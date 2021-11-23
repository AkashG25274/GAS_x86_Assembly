.section .rodata

	msg_main_print_choices:
	.string	"\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n"
	
	msg_main_print:
	.string	"Enter choice:\n"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_first_choice:
	.string	"Addition\n"
	
	msg_main_print_second_choice:
	.string	"Subtraction\n"
	
	msg_main_print_third_choice:
	.string	"Multiplication\n"
	
	msg_main_print_fourth_choice:
	.string	"Division\n"
	
	msg_main_print_invalid_choice:
	.string	"Invalid choice\n"

.section .data
	
	.globl	pArr
	.type	pArr, @object
	.size	pArr, 20
	.align	4
	
	pArr:
	.int	0
	.int	label_main_print_addition
	.int	label_main_print_subtraction
	.int	label_main_print_multiplication
	.int	label_main_print_division
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	pushl	$msg_main_print_choices
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	-4(%ebp), %eax
	
	cmpl	$1, %eax
	jl	label_main_default_choice
	
	cmpl	$4, %eax
	jg	label_main_default_choice
	
	label_main_jump_choice:
		movl	pArr( , %eax, 4), %ebx
		jmp	%ebx
	
label_main_print_addition:
	
	pushl	$msg_main_print_first_choice
	call	printf
	addl	$4, %esp
	
	jmp	label_main_exit
	
label_main_print_subtraction:

	pushl	$msg_main_print_second_choice
	call	printf
	addl	$4, %esp
	
	jmp	label_main_exit
	
label_main_print_multiplication:

	pushl	$msg_main_print_third_choice
	call	printf
	addl	$4, %esp

	jmp	label_main_exit
	
label_main_print_division:

	pushl	$msg_main_print_fourth_choice
	call	printf
	addl	$4, %esp

	jmp	label_main_exit
	
label_main_default_choice:

	pushl	$msg_main_print_invalid_choice
	call	printf
	addl	$4, %esp

label_main_exit:
	
	pushl	$0
	call	exit

