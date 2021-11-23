.section .rodata
	
	msg_main_print:
	.string	"Enter Number:\n"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_counter:
	.string	"%d\n"

.section .text

.globl	main
.type 	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp

	movl	$0, -8(%ebp)
	movl	$0, %eax
	
label_do_while_statement:

	pushl	%eax
	pushl	$msg_main_print_counter
	call	printf
	addl	$8, %esp
	
	addl	$1, -8(%ebp)
	
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_do_while_statement
	
	pushl	$0
	call	exit

