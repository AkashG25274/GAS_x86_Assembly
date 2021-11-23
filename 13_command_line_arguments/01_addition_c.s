.section .rodata
	
	msg_main_print_argc:
	.string	"argc is %d\n"
	
	msg_main_print_invalid_arguments:
	.string	"Invalid arguments: prog_name arg1 arg2"
	
	msg_main_print_values:
	.string	"Values are:"
	
	msg_main_print_newline:
	.string	"\n"
		
	msg_main_print_sum:
	.string	"Sum is %d\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	4(%ebp), %eax
	
	movl	$msg_main_print_argc, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	4(%ebp), %eax
	
	cmpl	$3, %eax
	jne	label_main_invalid_args
	
	movl	$msg_main_print_values, (%esp)
	call	puts
		
	movl	$0, -4(%ebp)
	jmp	label_main_for_condition
	
	label_main_for_statement:
		
		leal	8(%ebp), %ebx
		movl	(%ebx, %eax, 4), %ebx
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1, -4(%ebp)
		
	label_main_for_condition:
		
		movl	-4(%ebp), %eax
		movl	4(%ebp), %edx
		
		cmpl	%edx, %eax
		jl	label_main_for_statement
			
	movl	$msg_main_print_newline, (%esp)
	call	printf
	
	movl	12(%ebp), %ebx
	movl	%ebx, (%esp)
	call	atoi
	movl	%eax, -4(%ebp)
	
	movl	16(%ebp), %ebx
	movl	%ebx, (%esp)
	call	atoi
	
	movl	-4(%ebp), %edx
	addl	%edx, %eax
	
	movl	$msg_main_print_sum, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit
	
	label_main_invalid_args:
	
		movl	$msg_main_print_invalid_arguments, (%esp)
		call	puts
		
		movl	$-1, (%esp)
		call	exit

