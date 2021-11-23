.section .rodata
	
	msg_main_print_invalid_args:
	.string	"Invalid arguments: prog_name"
	
	msg_main_print_values:
	.string	"Envp values are:"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	4(%ebp), %eax
	cmpl	$1, %eax
	jne	label_main_invalid_args
	
	movl	$msg_main_print_values, (%esp)
	call	puts
	
	movl	$0, -4(%ebp)
	jmp	label_main_for_condition
	
	label_main_for_statement:
		
		leal	16(%ebp), %ebx
		movl	(%ebx, %eax, 4), %ebx
		
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1, -4(%ebp)
		
	label_main_for_condition:
		
		movl	-4(%ebp), %eax
		leal	16(%ebp), %ebx
		movl	(%ebx, %eax, 4), %ebx
		
		cmpl	$0, %ebx
		jne	label_main_for_statement
	
	movl	$0, (%esp)
	call	exit
	
	label_main_invalid_args:
		
		movl	$msg_main_print_invalid_args, (%esp)
		call	puts
		
		movl	$-1, (%esp)
		call	exit

