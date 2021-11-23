.section .rodata
	
	msg_main_print_enter_planes_rows_columns:
	.string	"Enter value of planes, rows & columns:\n"
	
	msg_main_scan_planes_rows_columns:
	.string	"%d%d%d"
	
	msg_main_print_allocation_fail:
	.string	"Memory allocation FAILED"
	
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
	
	subl	$28, %esp
	
	movl	$0, -28(%ebp)		#assign NULL
	
	pushl	$msg_main_print_enter_planes_rows_columns
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax		#Planes address
	leal	-8(%ebp), %edx		#iRows address
	leal	-12(%ebp), %ecx		#iColumns adddress
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_planes_rows_columns
	call	scanf
	addl	$16, %esp
	
	movl	-4(%ebp), %eax		#iPlanes
	movl	$4, %ecx		#size of int**
	mull	%ecx		
	
	pushl	%eax
	call	malloc
	addl	$4, %esp
	
	movl	%eax, -28(%ebp)		#base address of 3D
	
	cmpl	$0, %eax
	
	je	label_main_print_allocation_fail
	
	movl	$0, -16(%ebp)		#iCounter1 initialization
	
	jmp	label_main_outer1_for_condn_allocate_2D

label_main_outer1_for_statement_allocate_2D:
	
	movl	-28(%ebp), %ebx		#base address of 3D
	
	movl	-8(%ebp), %eax		#iRows
	movl	-12(%ebp), %ecx		#iColumns
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#size of 2D
	
	pushl	%eax
	call	malloc
	addl	$4, %esp
	
	movl	-16(%ebp), %ecx		#iCounter1
	
	movl	%eax, (%ebx, %ecx, 4)	#base address of 2D

	cmpl	$0, %eax
	
	je	label_main_print_allocation_fail
	
	movl	$0, -20(%ebp)		#iCounter2
	
	jmp	label_main_outer2_for_condn_allocate_1D
	
	label_main_outer2_for_statement_allocate_1D:
	
		movl	-12(%ebp), %eax		#iColumns
		movl	$4, %ecx
		mull	%ecx			#size of 1D
		
		pushl	%eax
		call	malloc
		addl	$4, %esp
		
		movl	-20(%ebp), %edx		#iCounter2
		movl	-16(%ebp), %ecx		#iCounter1
		
		movl 	-28(%ebp), %ebx		#base address of 3D
		movl	(%ebx, %ecx, 4), %ebx	#base address of 2D		
		movl	%eax, (%ebx, %edx, 4)	#base address of 1D
		
		cmpl	$0, %eax
		
		je	label_main_print_allocation_fail
		
		movl	$0, -24(%ebp)		#iCounter3 initialization
		
		jmp	label_main_inner_for_condn_enter_element
		
		label_main_inner_for_statement_enter_element:
			
			movl	-16(%ebp), %edx		#iCounter1
			movl	-20(%ebp), %ecx 	#iCounter2
			
			pushl	%eax
			pushl	%ecx
			pushl	%edx
			pushl	$msg_main_print_enter_element
			call	printf
			addl	$16, %esp
			
			movl	-24(%ebp), %eax		#iCounter3
			movl	-20(%ebp), %edx		#iCounter2
			movl	-16(%ebp), %ecx 	#iCounter1
			
			movl	-28(%ebp), %ebx		#base address of 3D
			movl	(%ebx, %ecx, 4), %ebx	#base address of 2D
			movl	(%ebx, %edx, 4), %ebx	#base address of 1D
			leal	(%ebx, %eax, 4), %ebx 	#address of element
			pushl	%ebx
			pushl	$msg_main_scan_element
			call	scanf
			addl	$8, %esp
			
			addl	$1, -24(%ebp)		#iCounter3 manipulation
			
		label_main_inner_for_condn_enter_element:
		
			movl	-24(%ebp), %eax		#iCounter3
			movl	-12(%ebp), %edx		#iColumns
			
			cmpl	%edx, %eax
			
			jl	label_main_inner_for_statement_enter_element
			
		addl	$1, -20(%ebp)			#iCounter2 manipulation
		
	label_main_outer2_for_condn_allocate_1D:
		
		movl	-20(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx
		
		cmpl	%edx, %eax
		
		jl	label_main_outer2_for_statement_allocate_1D
	
	addl	$1, -16(%ebp)			#iCounter1 manipulation
	
label_main_outer1_for_condn_allocate_2D:
	
	movl	-16(%ebp), %eax			#iCounter1
	movl	-4(%ebp), %edx			#iPlanes
	
	cmpl	%edx, %eax
	
	jl	label_main_outer1_for_statement_allocate_2D
	
	pushl	$msg_main_print_entered_elements
	call	printf
	addl	$4, %esp
	
	movl	$0, -16(%ebp)			#iCounter1 initialization
	
	jmp	label_main_outer1_for_condn_print_element

label_main_outer1_for_statement_print_element:
	
	movl	$0, -20(%ebp)			#iCounter2 initialization
	
	jmp	label_main_outer2_for_condn_print_element

	label_main_outer2_for_statement_print_element:
		
		movl	$0, -24(%ebp)		#iCounter3 initialization
	
		jmp	label_main_inner_for_condn_print_element
		
		label_main_inner_for_statement_print_element:
			
			movl	-16(%ebp), %edx		#iCounter1
			movl	-20(%ebp), %ecx		#iCounter2
			
			movl	-28(%ebp), %ebx		#base address of 3D
			movl	(%ebx, %edx, 4), %ebx	#base address of 2D
			movl	(%ebx, %ecx, 4), %ebx	#base address of 1D
			movl	(%ebx, %eax, 4), %ebx	#element
			
			pushl	%ebx
			pushl	%eax
			pushl	%ecx
			pushl	%edx
			pushl	$msg_main_print_element
			call	printf
			addl	$20, %esp
			
			addl	$1, -24(%ebp)		#iCounter3 manipulation
			
		label_main_inner_for_condn_print_element:
	
			movl	-24(%ebp), %eax		#iCounter3
			movl	-12(%ebp), %edx		#iColumns
	
			cmpl	%edx, %eax
	
			jl	label_main_inner_for_statement_print_element
		
		addl	$1, -20(%ebp)			#iCounter2 manipulation
		
	label_main_outer2_for_condn_print_element:

		movl	-20(%ebp), %eax			#iCounter2
		movl	-8(%ebp), %edx			#iRows
	
		cmpl	%edx, %eax
	
		jl	label_main_outer2_for_statement_print_element
	
	addl	$1, -16(%ebp)				#iCounter1 manipulation
	
label_main_outer1_for_condn_print_element:
	
	movl	-16(%ebp), %eax		#iCounter1
	movl	-4(%ebp), %edx		#iPlanes
	
	cmpl	%edx, %eax
	
	jl	label_main_outer1_for_statement_print_element

	movl	$0, -16(%ebp)		#iCounter1 initialization
	
	jmp	label_main_outer_for_condn_deallocate_memory

label_main_outer_for_statement_deallocate_memory:
	
	movl	$0, -20(%ebp)		#iCounter2 initialization
	
	jmp	label_main_inner_for_condn_deallocate_memory
	
	label_main_inner_for_statement_deallocate_memory:
		
		movl	-16(%ebp), %edx		#iCounter1
		
		movl	-28(%ebp), %ebx		#base adddress of 3D		
		movl	(%ebx, %edx, 4), %ebx	#base address of 2D
		movl	(%ebx, %eax, 4), %ebx	#base address of 1D
		
		pushl	%ebx
		call	free
		addl	$4, %esp
		
		movl	-28(%ebp), %ebx		#base adddress of 3D		
		movl	-16(%ebp), %eax		#iCounter1
		movl	-20(%ebp), %edx		#iCounter2
		
		movl	(%ebx, %eax, 4), %ebx	#base address of 2D
		movl	$0, (%ebx, %edx, 4)
		
		addl	$1, -20(%ebp)		#iCounter2 manipulation
		
	label_main_inner_for_condn_deallocate_memory:
		
		movl	-20(%ebp), %eax		#iCounter2
		movl	-8(%ebp), %edx		#iRows
		
		cmpl	%edx, %eax
		
		jl	label_main_inner_for_statement_deallocate_memory
	
	movl	-16(%ebp), %eax		#iCounter1
	
	movl	-28(%ebp), %ebx		#base address of 3D
	movl	(%ebx, %eax, 4), %ebx	#base address of 2D
	
	pushl	%ebx
	call	free
	addl	$4, %esp
	
	movl	-28(%ebp), %ebx		#base address of 3D
	movl	-16(%ebp), %eax		#iCounter1
	
	movl	$0, (%ebx, %eax, 4)
	
	addl	$1, -16(%ebp)		#iCounter1 manipulation
	
label_main_outer_for_condn_deallocate_memory:
	
	movl	-16(%ebp), %eax		#iCounter1
	movl	-4(%ebp), %edx		#iPlanes
	
	cmpl	%edx, %eax
	
	jl	label_main_outer_for_statement_deallocate_memory
	
	movl	-28(%ebp), %ebx		#base address of 3D
	pushl	%ebx
	call 	free
	addl	$4, %esp
	
	movl	$0, -28(%ebp)
	
	pushl	$0
	call 	exit
	
label_main_print_allocation_fail:
	
	pushl	$msg_main_print_allocation_fail
	call	puts
	addl	$4, %esp
	
	pushl	$-1
	call	exit

