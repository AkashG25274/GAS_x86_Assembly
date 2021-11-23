.section .rodata
	
	msg_main_print:
	.string	"Enter number:\n"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_even:
	.string	"Number is even\n"

.section .text

.globl main
.type main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	xorl	%edx, %edx
		
	movl	-4(%ebp), %eax	#first operand of div
	movl	$2, %ecx	#second operand of div
	
	div	%ecx
	
	cmpl	$0, %edx	#here %edx holds remainder

	jne	label_exit
	
	pushl	$msg_main_print_even
	call	printf
	addl	$4, %esp

label_exit:
	
	pushl	$0
	call	exit

