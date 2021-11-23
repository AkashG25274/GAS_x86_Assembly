.section .rodata

	msg_main_print_enter_dest:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_concatenated_str:
	.string	"\n\nConcatenated String Is:\t"
	
.section .text

.globl	main
.type 	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$80, %esp
	
	movl	$msg_main_print_enter_dest, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_source, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	leal	-60(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	strcat
	
	movl	$msg_main_print_concatenated_str, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

