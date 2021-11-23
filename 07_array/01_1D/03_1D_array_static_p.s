.EQU	MAX,	50

.section .rodata
	
	msg_main_print_enter_n:
	.string	"Enter value of n(< %d):\t"
	
	msg_main_scan:
	.string	"%d"
	
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
	
	subl	$208, %esp
	
	pushl	$MAX	
	pushl	$msg_main_print_enter_n
	call	printf
	addl	$8, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	$0, -8(%ebp)
	
	jmp	label_for_condition_enter_element

label_for_statement_enter_element:
	
	pushl	%eax
	pushl	$msg_main_print_enter_element
	call	printf
	addl	$8, %esp
	
	movl	-8(%ebp), %eax
	leal	-208(%ebp, %eax, 4), %ebx
	
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
	
	movl	-208(%ebp, %eax, 4), %edx
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
	
	pushl	$0
	call	exit

