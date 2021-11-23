.section .rodata
	
	msg_main_print_hello:
	.string	"Hello\n"
	
	msg_main_print_ans:
	.string	"Ans = %d\n"
	
	msg_main_print_arg1:
	.string	"%d\n"
	
	msg_main_print1_arg2:
	.string	"%d\t%d\n"
	
	msg_main_print2_arg2:
	.string	"%d\t%c\n"
	
	msg_main_print3_arg2:
	.string	"%c\t%d\n"
	
	msg_main_print4_arg2:
	.string	"%f\t%lf\n\n"

	float_value:
	.float	57.33
	
	double_value:
	.double	69.33	
		
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$msg_main_print_hello, (%esp)
	call	myprintf
	
	movl	$msg_main_print_ans, (%esp)
	movl	%eax, 4(%esp)
	call	myprintf
	
	movl	$msg_main_print_arg1, (%esp)
	movl	$10, 4(%esp)
	call	myprintf
	
	movl	$msg_main_print1_arg2, (%esp)
	movl	$10, 4(%esp)
	movl	$20, 8(%esp)
	call	myprintf
	
	movl	$msg_main_print2_arg2, (%esp)
	movl	$30, 4(%esp)
	movb	$'A', 8(%esp)
	call	myprintf
	
	movl	$msg_main_print3_arg2, (%esp)
	movb	$'B', 4(%esp)
	movl	$40, 5(%esp)
	call	myprintf
	
	finit
	fldl	double_value
	flds	float_value
	
	movl	$msg_main_print4_arg2, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	myprintf
	
	movl	$2, (%esp)
	movl	$10, 4(%esp)
	movl	$20, 8(%esp)
	call	addition
	
	movl	$msg_main_print_ans, (%esp)
	movl	%eax, 4(%esp)
	call	myprintf
	
	movl	$3, (%esp)
	movl	$10, 4(%esp)
	movl	$20, 8(%esp)
	movl	$30, 12(%esp)
	call	addition
	
	movl	$msg_main_print_ans, (%esp)
	movl	%eax, 4(%esp)
	call	myprintf

	movl	$4, (%esp)
	movl	$10, 4(%esp)
	movl	$20, 8(%esp)
	movl	$30, 12(%esp)
	movl	$40, 16(%esp)
	call	addition
	
	movl	$msg_main_print_ans, (%esp)
	movl	%eax, 4(%esp)
	call	myprintf
	
	movl	$0, (%esp)
	call	exit

.globl	myprintf
.type	myprintf, @function

myprintf:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	leal	12(%ebp), %eax

	movl	8(%ebp), %edx	
	movl	%edx, (%esp)
	movl	%eax, 4(%esp)
	call	vprintf
	
	movl	%ebp, %esp
	popl	%ebp
	ret

.globl	addition
.type	addition, @function

addition:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp

	movl	$0, %eax				#iSum
		
	leal	12(%ebp), %ebx				#address of first variable argument

	movl	8(%ebp), %ecx				#set loop counter, iTotalParams
		
	label_addition_loop:
		
		addl	(%ebx), %eax
		addl	$4, %ebx			#address + size of int = pointing to next element address
							
	loop	label_addition_loop
	
	movl	%ebp, %esp
	popl	%ebp
	ret

