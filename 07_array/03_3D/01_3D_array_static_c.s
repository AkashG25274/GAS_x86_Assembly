# n+(16-(n%16)) formula for highest multiple of 16

.EQU	MAX1,	5
.EQU	MAX2,	50

.section .rodata
	
	msg_main_print_enter_planes_rows_columns:
	.string	"Enter value of planes, rows & columns(< %d, %d, %d):\n"
	
	msg_main_scan_planes_rows_columns:
	.string	"%d%d%d"
	
	msg_main_print_enter_element:
	.string	"Enter [%d][%d][%d] value:\t"
	
	msg_main_scan_element:
	.string	"%d"
	
	msg_main_print_entered_elements:
	.string	"Entered elements are:\n"
	
	msg_main_print_element:
	.string	"[%d][%d][%d] value is:\t%d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16,	%esp		#align esp
	
	subl	$50048, %esp
	
	movl	$msg_main_print_enter_planes_rows_columns, (%esp)
	movl	$MAX1, 4(%esp)
	movl	$MAX2, 8(%esp)
	movl	$MAX2, 12(%esp)
	call	printf
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	leal	-12(%ebp), %ecx
	movl	$msg_main_scan_planes_rows_columns, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	call	scanf
	
	movl	$0, -16(%ebp)				#iCounter1 initialization
	
	jmp	label_main_outer1_for_condn_enter_element

label_main_outer1_for_statement_enter_element:
	
	movl	$0, -20(%ebp)				#iCounter2 initialization
	
	jmp	label_main_outer2_for_condn_enter_element
	
	label_main_outer2_for_statement_enter_element:
		
		movl	$0, -24(%ebp)			#iCounter3 initialization
		
		jmp	label_main_inner_for_condn_enter_element
		
		label_main_inner_for_statement_enter_element:
			
			movl	-16(%ebp), %edx		#iCounter1
			movl	-20(%ebp), %ecx		#iCounter2
			
			movl	$msg_main_print_enter_element, (%esp)
			movl	%edx, 4(%esp)
			movl	%ecx, 8(%esp)
			movl	%eax, 12(%esp)
			call	printf
			
			##################### Address Calculation #########################
			
			leal	-50024(%ebp), %ebx		#3D ch naaw(2D address)
			
			movl	-8(%ebp), %eax			#iRows
			movl	-12(%ebp), %ecx			#iColumns
			mull	%ecx
			
			movl	$4, %ecx
			mull	%ecx				#sizeof 2D
			
			movl	-16(%ebp), %ecx			#iCounter1
			mull	%ecx				#iCounter1 * sizeof 2D
			
			addl	%eax, %ebx			#2D ch naaw(1D address)
			
			movl	-12(%ebp), %eax			#iColumns
			movl	$4, %ecx
			mull	%ecx				#sizeof 1D
			
			movl	-20(%ebp), %ecx			#iCounter2
			mull	%ecx				#iCounter2 * sizeof1D
			
			addl	%eax, %ebx			#1D ch naaw(element addres)
			
			####################################################################
			
			movl	-24(%ebp), %eax			#iCounter3
			
			leal	(%ebx, %eax, 4), %ebx		#element address
			
			movl	$msg_main_scan_element, (%esp)
			movl	%ebx, 4(%esp)
			call	scanf
			
			addl	$1, -24(%ebp)			#iCounter3 manipulation
			
		label_main_inner_for_condn_enter_element:
			
			movl	-24(%ebp), %eax		#iCounter3
			movl	-12(%ebp), %edx		#iColumns
			
			cmpl	%edx, %eax
			
			jl	label_main_inner_for_statement_enter_element
		
		addl	$1, -20(%ebp)			#iCounter2 manipulation
		
	label_main_outer2_for_condn_enter_element:
		
		movl	-20(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iRows
		
		cmpl	%edx, %eax
		
		jl	label_main_outer2_for_statement_enter_element
	
	addl	$1, -16(%ebp)			#iCounter1 manipulation
	
label_main_outer1_for_condn_enter_element:
	
	movl	-16(%ebp), %eax		#iCounter1
	movl	-4(%ebp), %edx		#iPlanes
	
	cmpl	%edx, %eax
	
	jl	label_main_outer1_for_statement_enter_element
	
	movl	$msg_main_print_entered_elements, (%esp)
	call	printf
	
	movl	$0, -16(%ebp)		#iCounter1 initialization
	
	jmp	label_main_outer1_for_condn_print_element

label_main_outer1_for_statement_print_element:
	
	movl	$0, -20(%ebp)		#iCounter2 initialization
	
	jmp	label_main_outer2_for_condn_print_element
	
	label_main_outer2_for_statement_print_element:
		
		movl	$0, -24(%ebp)		#iCounter3 initialization
		
		jmp	label_main_inner_for_condn_print_element
		
		label_main_inner_for_statement_print_element:
			
			######################### Address Calculation ###################
			
			leal	-50024(%ebp), %ebx		#3D ch naaw(2D address)
			
			movl	-8(%ebp), %eax			#iRows
			movl	-12(%ebp), %ecx			#iColumns
			mull	%ecx
			
			movl	$4, %ecx
			mull	%ecx				#sizeof 2D
			
			movl	-16(%ebp), %ecx			#iCounter1
			mull	%ecx				#iCounter1 * sizeof 2D
			
			addl	%eax, %ebx			#2D ch naaw(1D address)
			
			movl	-12(%ebp), %eax			#iColumns
			movl	$4, %ecx
			mull	%ecx				#sizeof 1D
			
			movl	-20(%ebp), %ecx			#iCounter2
			mull	%ecx				#iCounter2 * sizeof1D
			
			addl	%eax, %ebx			#1D ch naaw(element address)
			
			######################################################################
			
			movl	-24(%ebp), %eax			#iCounter3
			
			movl	(%ebx, %eax, 4), %ebx		#element
			
			movl	-16(%ebp), %edx			#iCounter1
			
			movl	$msg_main_print_element, (%esp)
			movl	%edx, 4(%esp)
			movl	%ecx, 8(%esp)
			movl	%eax, 12(%esp)
			movl	%ebx, 16(%esp)
			call	printf
			
			addl	$1, -24(%ebp)			#iCounter3 manipulation
			
		label_main_inner_for_condn_print_element:
			
			movl	-24(%ebp), %eax		#iCounter3
			movl	-12(%ebp), %edx		#iColumns
			
			cmpl	%edx, %eax
			
			jl	label_main_inner_for_statement_print_element
		
		addl	$1, -20(%ebp)			#iCounter2 manipulation
		
	label_main_outer2_for_condn_print_element:
		
		movl	-20(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iRows
		
		cmpl	%edx, %eax
		
		jl	label_main_outer2_for_statement_print_element
	
	addl	$1, -16(%ebp)			#iCounter1 manipulation
	
label_main_outer1_for_condn_print_element:
	
	movl	-16(%ebp), %eax		#iCounter1
	movl	-4(%ebp), %edx		#iPlanes
	
	cmpl	%edx, %eax
	
	jl	label_main_outer1_for_statement_print_element
	
	movl	$0, (%esp)
	call	exit

