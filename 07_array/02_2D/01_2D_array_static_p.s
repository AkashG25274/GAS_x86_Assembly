
.EQU	MAX,	50	

.section .rodata
	
	msg_main_print_enter_row_column:
	.string	"Enter value of rows & columns(< %d):\n"
	
	msg_main_scan_row_column:
	.string	"%d%d"
	
	msg_main_print_enter_element:
	.string	"Enter [%d][%d] value:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_entered_elements:
	.string	"Entered elements are:\n"
	
	msg_main_print_element:
	.string	"[%d][%d] value is:\t%d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$10016, %esp
	
	pushl	$MAX
	pushl	$msg_main_print_enter_row_column
	call	printf
	addl	$8, %esp
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_row_column
	call	scanf
	addl	$12, %esp
	
	movl	$0, -12(%ebp)			#iCounter1 initialization
	
	jmp	label_outer_for_condition_enter_elements

label_outer_for_statement_enter_elements:
	
		movl	$0, -16(%ebp)		#iCounter2 initialization
	
		jmp	label_inner_for_condition_enter_elements
	
	label_inner_for_statement_enter_elements:
	
		movl	-12(%ebp), %edx
		pushl	%eax			#iCounter2
		pushl	%edx			#iCounter1
		pushl	$msg_main_print_enter_element
		call	printf
		addl	$12, %esp
		
		###################### Address Calculation ######################
			
		leal	-10016(%ebp), %ebx	#base address
		
		movl	-8(%ebp), %eax		#iColumns
		movl	$4, %ecx
		mull	%ecx			#size of datatype(1D)

		movl	-12(%ebp), %ecx		#iCounter1
		mull	%ecx			#iCounter1 * size of datatype
		
		addl	%eax, %ebx
		
		##################################################################
		
		movl	-16(%ebp), %eax		#iCounter2
		
		leal	(%ebx, %eax, 4), %ebx
		
		pushl	%ebx
		pushl	$msg_main_scan
		call	scanf
		addl	$8, %esp
		
		addl	$1, -16(%ebp)		#iCounter2 manipulation
		
	label_inner_for_condition_enter_elements:
	
		movl	-16(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iColumns
	
		cmpl	%edx, %eax
	
		jl	label_inner_for_statement_enter_elements
	
	addl	$1, -12(%ebp)			#iCounter1 manipulation
	
label_outer_for_condition_enter_elements:
	
	movl	-12(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iRows
	
	cmpl	%edx, %eax
	
	jl	label_outer_for_statement_enter_elements
	
	pushl	$msg_main_print_entered_elements
	call	printf
	addl	$4, %esp
	
	movl	$0, -12(%ebp)
	
	jmp	label_outer_for_condition_print_elements

label_outer_for_statement_print_elements:
	
	movl	$0, -16(%ebp)			#iCounter2 initialization
	
	jmp	label_inner_for_condition_print_elements
	
	label_inner_for_statement_print_elements:
		
		############## Address Caculation ########################
		
		leal	-10016(%ebp), %ebx	#base address
		
		movl	-8(%ebp), %eax		#iColumns
		movl	$4, %ecx
		mull	%ecx			#size of datatype(1D)
		
		movl	-12(%ebp), %ecx		#iCounter1
		mull	%ecx			#iCounter1 * size of datataype
		
		addl	%eax, %ebx
		
		###########################################################
		
		movl	-16(%ebp), %eax		#iCounter2
		movl	(%ebx, %eax, 4), %edx
				
		pushl	%edx			#element
		pushl	%eax			#iCounter2
		pushl	%ecx			#iCounter1
		pushl	$msg_main_print_element
		call	printf
		addl	$16, %esp
		
		addl	$1, -16(%ebp)		#iCounter2 manipulation
		
	label_inner_for_condition_print_elements:
	
		movl	-16(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iColumns
	
		cmpl	%edx, %eax
	
		jl	label_inner_for_statement_print_elements
	
	addl	$1, -12(%ebp)			#iCounter1 manipulation
	
label_outer_for_condition_print_elements:
	
	movl	-12(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iRows
	
	cmpl	%edx, %eax
	
	jl	label_outer_for_statement_print_elements
	
	pushl	$0
	call	exit

