.section .rodata
	
	msg_main_print_enter_dest:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_enter_n:
	.string	"\n\nEnter Value Of n:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_concatenated_str:
	.string	"\n\nConcatenated String Is:\t"

.section .text

.globl	main
.type	main, @function

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
	
	movl	$msg_main_print_enter_n, (%esp)
	call	printf
	
	leal	-64(%ebp), %ebx
	movl	$msg_main_scan, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	leal	-60(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	-64(%ebp), %ecx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	strncat
	
	movl	$msg_main_print_concatenated_str, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

