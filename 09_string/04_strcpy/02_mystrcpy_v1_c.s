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
	
	movl	8(%ebp), %edi
	movl	12(%ebp), %esi
	movl	$20, %ecx				#size of source string array
	
	label_mystrcpy_copy:
		
		lodsb
		stosb
		
		cmpb	$0, %al
		je	label_mystrcpy_return
		
	loop	label_mystrcpy_copy
	
	label_mystrcpy_return:
		
		movl	8(%ebp), %eax
		
		movl	%ebp, %esp
		popl	%ebp
		ret

