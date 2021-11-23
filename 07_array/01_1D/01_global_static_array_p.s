.section .rodata
	
	msg_main_print_enter_n:
	.string	"Enter value of n(< %d):\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_enter_element:
	.string	"Enter %d value:\t"
	
	msg_main_print_arr1:
	.string	"arr1 is:\n"
	
	msg_main_print_arr_element:
	.string	"%d value is:\t%d\n"
	
	msg_main_print_arr2:
	.string	"arr2 is:\n"

.EQU	MAX, 50

.section .data
	
	.globl	arr1
	.type	arr1, @object
	.size	arr1, 12
	.align	4
	
	arr1:
		.int	10, 20, 30

.section .bss

	.comm	arr2, 200, 4
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$8, %esp
	
	pushl	$MAX
	pushl	$msg_main_print_enter_n
	call	printf
	addl	$8, %esp
	
	leal	-4(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	movl	$0, -8(%ebp)		#iCounter initialzation
	
	jmp	label_for_enter_arr2_condition
		
label_for_enter_arr2_statement:
	
	pushl	%eax
	pushl	$msg_main_print_enter_element
	call	printf
	addl	$4, %esp
	
	movl	-8(%ebp), %eax
	leal	arr2( , %eax, 4), %ebx		#index addressing mode
	pushl	%ebx
	pushl	$msg_main_scan
	call	scanf
	addl	$8, %esp
	
	addl	$1, -8(%ebp)			#iCounter manipulation
	
label_for_enter_arr2_condition:
	
	movl	-8(%ebp), %eax		#iCounter
	movl	-4(%ebp), %edx		#iMax
	
	cmpl	%edx, %eax
	
	jl	label_for_enter_arr2_statement

	pushl	$msg_main_print_arr1
	call	printf
	addl	$4, %esp
	
	movl	$0, -8(%ebp)		#iCounter initialization
		
	jmp	label_for_print_arr1_condition
	
label_for_print_arr1_statement:

	movl	arr1( , %eax, 4), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_arr_element
	call	printf
	addl	$12, %esp
	
	addl	$1, -8(%ebp)		#iCounter maniulation
	
label_for_print_arr1_condition:

	movl	-8(%ebp), %eax
	
	cmpl	$3, %eax
	
	jl	label_for_print_arr1_statement
	
	pushl	$msg_main_print_arr2
	call	printf
	addl	$4, %esp

	movl	$0, -8(%ebp)		#iCounter initialization
	
	jmp	label_for_print_arr2_condition
		
label_for_print_arr2_statement:

	movl	arr2( , %eax, 4), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_arr_element
	call	printf
	addl	$12, %esp
	
	addl	$1, -8(%ebp)		#iCounter manipaulation
	
label_for_print_arr2_condition:

	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_for_print_arr2_statement
	
	pushl	$0
	call	exit

