.section .rodata

	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_source:
	.string	"\n\nSource String Is:\t"
	
	msg_main_print_dest:
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
	
	movl	$msg_main_print_source, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	leal	-40(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	mystrcpy
	
	movl	$msg_main_print_dest, (%esp)
	call	printf
	
	leal	-40(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

######################################## mystrcpy ##########################################

.globl	mystrcpy
.type	mystrcpy, @function

mystrcpy:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	12(%ebp), %ebx				#source string base address
	movl	%ebx, (%esp)
	call	mystrlen
	
	addl	$1, %eax
	movl	%eax, %ecx				#set counter
	
	movl	8(%ebp), %edi				#set dest
	movl	12(%ebp), %esi				#set source
	
	rep	movsb
	
	movl	8(%ebp), %eax				#return dest string
	
	movl	%ebp, %esp
	popl	%ebp
	ret

