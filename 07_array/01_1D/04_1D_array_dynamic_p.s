.section .rodata
	
	msg_main_print_enter_n:
	.string	"Enter value of n:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_allocation_fail:
	.string	"Memory allocation FAILED"
	
	msg_main_print_enter_element:
	.string	"Enter %d value:\t"
	
	msg_main_print_entered_element:
	.string	"Entered elements are:\n"
	
	msg_main_print_element:
	.string	"%d value is:\t%d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$12, %esp
	
	movl	$0, -12(%ebp)
	
	pushl	$msg_main_print_enter_n
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	-4(%ebp), %eax
	movl	$4, %ecx
	mull	%ecx
	
	pushl	%eax
	call	malloc
	addl	$4, %esp
	
	movl	%eax, -12(%ebp)
	
	cmpl	$0, -12(%ebp)
	
	je	label_main_allocation_fail
	
	movl	$0, -8(%ebp)
	
	jmp	label_for_condition_enter_element

label_for_statement_enter_element:
	
	pushl	%eax
	pushl	$msg_main_print_enter_element
	call	printf
	addl	$8, %esp
	
	movl	-8(%ebp), %eax
	movl	-12(%ebp), %ebx
	
	leal	(%ebx, %eax, 4), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	addl	$1, -8(%ebp)
	
label_for_condition_enter_element:
	
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_for_statement_enter_element
	
	pushl	$msg_main_print_entered_element
	call	printf
	addl	$4, %esp
	
	movl	$0, -8(%ebp)
	
	jmp	label_for_condition_print_element

label_for_statement_print_element:
	
	movl	-12(%ebp), %ebx
	movl	(%ebx, %eax, 4), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_element
	call	printf
	addl	$12, %esp
	
	addl	$1, -8(%ebp)
	
label_for_condition_print_element:
	
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_for_statement_print_element
	
	movl	-12(%ebp), %ebx
	pushl	%ebx
	call	free
	addl	$4, %esp
	
	movl	$0, -12(%ebp)
	
	pushl	$0
	call	exit
	
label_main_allocation_fail:
	
	pushl	$msg_main_print_allocation_fail
	call	puts
	addl	$4, %esp
	
	movl	$-1, %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

