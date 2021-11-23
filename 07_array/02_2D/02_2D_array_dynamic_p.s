.section .rodata
	
	msg_main_print_enter_row_column:
	.string	"Enter value of rows & columns:\n"
	
	msg_main_scan_row_column:
	.string	"%d%d"
	
	msg_main_print_allocation_fail:
	.string	"Memory allocaton FAILED"
	
	msg_main_print_enter_element:
	.string	"Enter [%d][%d] value:\t"
	
	msg_main_scan_element:
	.string	"%d"
	
	msg_main_print_element:
	.string	"[%d][%d] value is:\t%d\n"

	msg_main_print_entered_element:
	.string	"Entered elements are:\n"
		
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$20, %esp
	
	movl	$0, -20(%ebp)
	
	pushl	$msg_main_print_enter_row_column
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_row_column
	call	scanf
	addl	$12, %esp
	
	movl	-4(%ebp), %eax			#iRows
	movl	$4, %ecx
	mull	%ecx			
	
	pushl	%eax
	call	malloc
	addl	$4, %esp
	
	movl	%eax, -20(%ebp)		
	
	cmpl	$0, %eax		
	
	je	label_main_memory_allocation_fail
	
	movl	$0, -12(%ebp)			#iCounter1 initialization
	
	jmp	label_outer_for_condition_allocate_memory

label_outer_for_statement_allocate_memory:
	
	movl	-8(%ebp), %eax			#iColumns
	movl	$4, %ecx
	mull	%ecx				#calculate size of 1D
	
	pushl	%eax
	call	malloc
	addl	$4, %esp
	
	movl	-20(%ebp), %ebx			#value of pPtr
	movl	-12(%ebp), %ecx			#iCounter1
	movl	%eax, (%ebx, %ecx, 4)		#move address of 1D
	
	cmpl	$0, %eax
	
	je	label_main_memory_allocation_fail
	
	movl	$0, -16(%ebp)			#iCounter2 initialization
	
	jmp	label_inner_for_condn_enter_element

	label_inner_for_statement_enter_element:
	
		movl	-12(%ebp), %edx		#iCounter1
	
		pushl	%eax			#iCounter2
		pushl	%edx			#iCounter1
		pushl	$msg_main_print_enter_element
		call	printf
		addl	$12, %esp
	
		movl	-20(%ebp), %ebx		#value of pPtr
		movl	-12(%ebp), %eax		#iCounter1
		movl	(%ebx, %eax, 4), %ebx	#address of 1D
	
		movl	-16(%ebp), %eax		#iCounter2
		leal	(%ebx, %eax, 4), %ebx	#address of element
	
		pushl	%ebx
		pushl	$msg_main_scan_element
		call	scanf
		addl	$8, %esp
	
		addl	$1, -16(%ebp)		#iCounter2 manipulation
	
	label_inner_for_condn_enter_element:
	
		movl	-16(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iColumn
	
		cmpl	%edx, %eax
	
		jl	label_inner_for_statement_enter_element
	
		addl	$1, -12(%ebp)		#iCounter1 manipulation
	
label_outer_for_condition_allocate_memory:
	
	movl	-12(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iRows
	
	cmpl	%edx, %eax
	
	jl	label_outer_for_statement_allocate_memory
	
	pushl	$msg_main_print_entered_element
	call	printf
	addl	$4, %esp
	
	movl	$0, -12(%ebp)			#iCounter1 initialization
	
	jmp	label_outer_for_condn_print_element

label_outer_for_statement_print_element:
	
	movl	$0, -16(%ebp)			#iCounter2
	
	jmp	label_inner_for_condn_print_element

	label_inner_for_statement_print_element:
	
		movl	-12(%ebp), %edx		#iCounter1
	
		movl	-20(%ebp), %ebx
		movl	(%ebx, %edx, 4), %ebx
		movl	(%ebx, %eax, 4), %ecx
	
		pushl	%ecx			#element
		pushl	%eax			#iCounter2
		pushl	%edx			#iCounter1
		pushl	$msg_main_print_element
		call	printf
		addl	$16, %esp
	
		addl	$1, -16(%ebp)
	
	label_inner_for_condn_print_element:
	
		movl	-16(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iColumns
	
		cmpl	%edx, %eax
	
		jl	label_inner_for_statement_print_element
	
		addl	$1, -12(%ebp)
	
label_outer_for_condn_print_element:
	
	movl	-12(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iRows
	
	cmpl	%edx, %eax
	
	jl	label_outer_for_statement_print_element
	
	movl	$0, -12(%ebp)			#iCounter1
	
	jmp	label_for_condn_deallocate

label_for_statement_deallocate:

	movl	-20(%ebp), %ebx			#value of pPtr
	
	movl	(%ebx, %eax, 4), %edx
	pushl	%edx
	call	free
	addl	$4, %esp

	movl	-20(%ebp), %ebx			#value of pPtr
	movl	-12(%ebp), %eax			#iCounter1
		
	movl	$0, (%ebx, %eax, 4)
	#movl	$0, %edx	
	
	addl	$1, -12(%ebp)			#iCounter1 manipulation
	
label_for_condn_deallocate:
	
	movl	-12(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iRows
	
	cmpl	%edx, %eax
	
	jl	label_for_statement_deallocate
	
	pushl	%ebx				#vale of pPtr
	call	free
	addl	$4, %esp
	
	movl	$0, -20(%ebp)
	
	pushl	$0
	call	exit
	
label_main_memory_allocation_fail:
	
	pushl	$msg_main_print_allocation_fail
	call	printf
	addl	$4, %esp
	
	pushl	$-1
	call	exit

