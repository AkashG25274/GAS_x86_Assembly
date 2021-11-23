.section .rodata
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_source_str:
	.string	"\n\nSource String Is:\t"
	
	msg_main_print_dest_str:
	.string	"\n\nDestination String Is:\t"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$48, %esp
	
	movl	$msg_main_print_enter_source, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_source_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	leal	-40(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	strcpy
	
	movl	$msg_main_print_dest_str, (%esp)
	call	printf
	
	leal	-40(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

