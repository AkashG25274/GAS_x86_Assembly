.EQU	MAX1,	5
.EQU	MAX2,	50

.section .rodata
	
	msg_main_print_enter_planes_row_column:
	.string	"Enter value of planes, rows & columns(< %d, %d, %d):\n"
	
	msg_main_scan_plane_row_column:
	.string	"%d%d%d"
	
	msg_main_print_enter_element:
	.string	"Enter [%d][%d][%d] value:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_entered_elements:
	.string	"Entered Elements are:\n"
	
	msg_main_print_element:
	.string	"[%d][%d][%d] value is:\t%d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$50024, %esp
	
	pushl	$MAX2
	pushl	$MAX2
	pushl	$MAX1
	pushl	$msg_main_print_enter_planes_row_column
	call	printf
	addl	$16, %esp
	
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	leal	-12(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_plane_row_column
	call	scanf
	addl	$16, %esp
	
	movl	$0, -16(%ebp)			#iCounter1 initialization
	
	jmp	label_outer1_for_condition_enter_element

label_outer1_for_statement_enter_element:
	
	movl	$0, -20(%ebp)			#iCounter2 initialization
	
	jmp	label_outer2_for_condition_enter_element
	
	label_outer2_for_statement_enter_element:
		
		movl	$0, -24(%ebp)		#iCounter3 initialization
		
		jmp	label_inner_for_condition_enter_element
		
		label_inner_for_statement_enter_element:
			
			movl	-20(%ebp), %edx	
			movl	-16(%ebp), %ecx		
			
			pushl	%eax				#iCounter3
			pushl	%edx				#iCounter2
			pushl	%ecx				#iCounter1
			pushl	$msg_main_print_enter_element
			call	printf
			addl	$16, %esp
			
			##################### Address Calculation #######################
			
			leal	-50024(%ebp), %ebx		#base address
			
			movl	-8(%ebp), %eax
			movl	-12(%ebp), %ecx
			mull	%ecx
			
			movl	$4, %ecx
			mull	%ecx				#size of 2D
			
			movl	-16(%ebp), %ecx
			mull	%ecx				#iCounter1 * size of 2D	
			
			addl	%eax, %ebx			#address of 1D
			
			movl	-12(%ebp), %eax			#iColumns
			movl	$4, %ecx
			mull	%ecx				#size of 1D
			
			movl	-20(%ebp), %ecx
			mull	%ecx				#iCounter2 * size of 1D
			
			addl	%eax, %ebx
			
			###################################################################
			
			movl	-24(%ebp), %eax			#iCounter3
			
			leal	(%ebx, %eax, 4), %ebx
			
			pushl	%ebx
			pushl	$msg_main_scan
			call	scanf
			addl	$8, %esp
			
			addl	$1, -24(%ebp)			#iCounter3 manipulation
			
		label_inner_for_condition_enter_element:
			
			movl	-24(%ebp), %eax			#iCounter3
			movl	-12(%ebp), %edx
			
			cmpl	%edx, %eax
			
			jl	label_inner_for_statement_enter_element
		
		addl	$1, -20(%ebp)				#iCounter2 manipulation
		
	label_outer2_for_condition_enter_element:
		
		movl	-20(%ebp), %eax
		movl	-8(%ebp), %edx
		
		cmpl	%edx, %eax
		
		jl	label_outer2_for_statement_enter_element
	
	addl	$1, -16(%ebp)					#iCounter1 manipulation
	
label_outer1_for_condition_enter_element:
	
	movl	-16(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_outer1_for_statement_enter_element
	
	pushl	$msg_main_print_entered_elements
	call	printf
	addl	$4, %esp
	
	movl	$0, -16(%ebp)			#iCounter1 initialization
	
	jmp	label_outer1_for_condition_print_element

label_outer1_for_statement_print_element:
	
	movl	$0, -20(%ebp)			#iCounter2 initialization
	
	jmp	label_outer2_for_condition_print_element
	
	label_outer2_for_statement_print_element:
		
		movl	$0, -24(%ebp)		#iCounter3 initialization
		
		jmp	label_inner_for_condition_print_element
		
		label_inner_for_statement_print_element:
			
			######################### Address Calculation ######################
			
			leal	-50024(%ebp), %ebx		#base address
			
			movl	-8(%ebp), %eax
			movl	-12(%ebp), %ecx
			mull	%ecx
			
			movl	$4, %ecx
			mull	%ecx				#size of 2D
			
			movl	-16(%ebp), %ecx
			mull	%ecx				#iCounter1 * size of 2D	
			
			addl	%eax, %ebx			#address of 1D
			
			movl	-12(%ebp), %eax			#iColumns
			movl	$4, %ecx
			mull	%ecx				#size of 1D
			
			movl	-20(%ebp), %ecx
			mull	%ecx				#iCounter2 * size of 1D
			
			addl	%eax, %ebx
			
			###################################################################
			
			movl	-24(%ebp), %eax			#iCounter3
			
			movl	(%ebx, %eax, 4), %edx
			
			movl	-16(%ebp), %ebx
#			movl	-20(%ebp), %ecx
			
			pushl	%edx				#element
			pushl	%eax				#iCounter3
			pushl	%ecx				#iCounter2
			pushl	%ebx				#iCounter1
			pushl	$msg_main_print_element
			call	printf
			addl	$20, %esp
			
			addl	$1, -24(%ebp)			#iCounter3 manipulation
			
		label_inner_for_condition_print_element:
			
			movl	-24(%ebp), %eax			#iCounter3
			movl	-12(%ebp), %edx
			
			cmpl	%edx, %eax
			
			jl	label_inner_for_statement_print_element
		
		addl	$1, -20(%ebp)				#iCounter2 manipulation
		
	label_outer2_for_condition_print_element:
		
		movl	-20(%ebp), %eax
		movl	-8(%ebp), %edx
		
		cmpl	%edx, %eax
		
		jl	label_outer2_for_statement_print_element
	
	addl	$1, -16(%ebp)					#iCounter1 manipulation
	
label_outer1_for_condition_print_element:
	
	movl	-16(%ebp), %eax
	movl	-4(%ebp), %edx
	
	cmpl	%edx, %eax
	
	jl	label_outer1_for_statement_print_element
	
	pushl	$0
	call	exit

