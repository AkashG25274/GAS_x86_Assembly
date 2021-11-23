.section .rodata
	
	msg_main_print_enter_numbers:
	.string	"Enter two floating point numbers:\n"
	
	msg_main_scan:
	.string	"%f%f"
	
	msg_main_print_less_than:
	.string	"fNo1 is less than fNo2"
	
	msg_main_print_greater_than:
	.string	"fNo1 is greater than fNo2"
	
	msg_main_print_equal:
	.string	"values are equal"
	
	msg_main_print_numbers:
	.string	"fNo1=%f, fNo2=%f\n"
		
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$msg_main_print_enter_numbers, (%esp)
	call	printf
	
	leal	-4(%ebp), %eax				#fNo1 address
	leal	-8(%ebp), %edx				#fNo2 address
	movl	$msg_main_scan, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	call	scanf
			
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	Compare
	
	cmpl	$-1, %eax
	jne	label_main_check_greater_than
	
	movl	$msg_main_print_less_than, (%esp)
	call	puts
	
	jmp	label_main_exit
	
	label_main_check_greater_than:
		
		cmpl	$1, %eax
		jne	label_main_print_equal
		
		movl	$msg_main_print_greater_than, (%esp)
		call	puts
		
		jmp	label_main_exit
	
	label_main_print_equal:
		
		movl	$msg_main_print_equal, (%esp)
		call	puts
	
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

################################ Compare function ###############################

.globl	Compare
.type	Compare, @function

Compare:
	pushl	%ebp
	movl	%esp, %ebp
	
	finit
		
	flds	12(%ebp)
	flds	8(%ebp)
	
	fcompp					#compares st(0) with st(1), pop two times
						#stores status in FPU status register
									
	fstsw					#retrieves status register from FPU to %ax
	sahf					#loads eflags from %ah
	
	jnb	label_compare_check_above
		
		movl	$-1, %eax
		jmp	label_compare_return
		
	label_compare_check_above:
		
		jna	label_compare_equal
		
		movl	$1, %eax
		jmp	label_compare_return
		
	label_compare_equal:
		
		movl	$0, %eax
		
	label_compare_return:
		
		movl	%ebp, %esp
		popl	%ebp
		ret

