.section .rodata
	
	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_upper_str:
	.string	"\nString In Upper Case Is:\t"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$msg_main_print_enter_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	mystrupr
	
	movl	$msg_main_print_upper_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit
	
####################################### mystrupr #####################################################

.globl	mystrupr
.type	mystrupr, @function

mystrupr:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %esi
	movl	8(%ebp), %edi
	movl	$20, %ecx
		
	label_mystrupr_loop:
		
		lodsb
		
		cmpb	$97, %al
		jnge	label_mystrupr_next_char
		
		cmpb	$122, %al
		jnle	label_mystrupr_next_char
		
		subb	$32, %al
		
		label_mystrupr_next_char:
			
			stosb
		
		cmpb	$0, %al
		je	label_mystrupr_return
		
	loop	label_mystrupr_loop
	
	label_mystrupr_return:
		
		movl	8(%ebp), %eax
		
		movl	%ebp, %esp
		popl	%ebp
		ret

