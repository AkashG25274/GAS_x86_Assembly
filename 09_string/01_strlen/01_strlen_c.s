.section .rodata
	
	ptr_str:
	.string	"Hello"
	
	morning_str:
	.string	"Morning"
	
	msg_main_print_length_hello:
	.string	"\nThe Length Of Hello Is %d\n"
	
	msg_main_print_length_good:
	.string	"The Lenght of Good Is %d\n"
	
	msg_main_print_length_morning:
	.string	"The Length of Morning Is %d\n"

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
	call	strlen

	movl	$msg_main_print_length_hello, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	leal	-9(%ebp), %ebx
	movl	%ebx, (%esp)
	call	strlen
	
	movl	$msg_main_print_length_good, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$morning_str, (%esp)
	call	strlen
	
	movl	$msg_main_print_length_morning, (%esp)	
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit

