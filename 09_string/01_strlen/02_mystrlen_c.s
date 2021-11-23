.section .rodata
	
	ptr_str:
	.string	"Hello"
	
	msg_main_print_length_hello:
	.string	"\nThe Length Of Hello Is %d\n"
	
	msg_main_print_length_good:
	.string	"The Lenght of Good Is %d\n"
	
	msg_main_print_length_morning:
	.string	"The Length of Morning Is %d\n"
	
	morning_str:
	.string	"Morning"
	
	debug_print:
	.string	"Character fetched:%c\n"
		
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$ptr_str, -4(%ebp)
	
	movb	$'G', -9(%ebp)
	movb	$'o', -8(%ebp)
	movb	$'o', -7(%ebp)
	movb	$'d', -6(%ebp)
	movb	$0, -5(%ebp)
	
	movl	-4(%ebp), %ebx	
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	$msg_main_print_length_hello, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	leal	-9(%ebp), %ebx
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	$msg_main_print_length_good, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$morning_str, (%esp)
	call	mystrlen
	
	movl	$msg_main_print_length_morning, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit

###################################### mystrlen ###################################################

.globl	mystrlen
.type	mystrlen, @function

mystrlen:
	pushl	%ebp
	movl	%esp, %ebp
		
	movl	8(%ebp), %esi			#base address of string
	movl	$0, %edx			#index counter
	movl	$255, %ecx			#loop counter
	
	label_mystrlen_loop:
		
		lodsb
		
		cmpb	$0, %al
		je	label_mystrlen_return
						
		addl	$1, %edx
		
	loop	label_mystrlen_loop
	
	label_mystrlen_return:
	
		movl	%edx, %eax		
		movl	%ebp, %esp
		popl	%ebp
		ret

