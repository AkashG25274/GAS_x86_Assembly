.section .rodata

	msg_main_print_enter_n:
	.string	"Enter value of n:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_allocation_fail:
	.string	"Memory allocation FAILED"
	
	msg_main_print_enter_element:
	.string	"Enter %d value:\t"
	
	msg_main_print_entered_elements:
	.string	"Entered elements are:\n"
	
	msg_main_print_element:
	.string	"%d value is:\t%d\n"

.section .data
	
	.globl	pPtr
	.type	pPtr, @object
	.size	pPtr, 4
	.align	4
	
	pPtr:
		.int	0

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
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
	
	movl	%eax, pPtr
	
	cmpl	$0, %eax
	
	je	label_main_allocation_fail
	
	movl	$0, -8(%ebp)
	
	jmp	label_for_condition_enter_element

label_for_statement_enter_element:
	
	pushl	%eax
	pushl	$msg_main_print_enter_element
	call	printf
	addl	$4, %esp
	
	movl	-8(%ebp), %eax
	movl	pPtr,	%ebx
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
		
	pushl	$msg_main_print_entered_elements
	call	printf
	addl	$4, %esp
	
	movl	$0, -8(%ebp)
	
	jmp	label_for_condition_print_element

label_for_statement_print_element:
	
	movl	pPtr, %ebx
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
	
	pushl	pPtr
	call	free
	addl	$4, %esp
	
	movl	$0, pPtr
	
	pushl	$0
	call	exit
	
label_main_allocation_fail:
	
	pushl	$msg_main_print_allocation_fail
	call	puts
	addl	$4, %esp
	
	pushl	$-1
	call	exit

