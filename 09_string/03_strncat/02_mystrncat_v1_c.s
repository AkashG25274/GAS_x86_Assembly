.section .rodata
	
	msg_main_print_enter_dest:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_enter_n:
	.string	"\n\nEnter Value Of n:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_concatenated_string:
	.string	"\n\nConcatenated String Is:\t"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$80, %esp
	
	movl	$msg_main_print_enter_dest, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_source, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_n, (%esp)
	call	printf
	
	leal	-64(%ebp), %ebx
	movl	$msg_main_scan, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	leal	-60(%ebp), %eax				#dest base address			
	leal	-20(%ebp), %edx				#source base address
	movl	-64(%ebp), %ecx				#n
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	mystrncat
	
	movl	$msg_main_print_concatenated_string, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

####################################### mystrncat #################################################

.globl	mystrncat
.type	mystrncat, @function

mystrncat:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %esi				#dest base address
	movl	$40, %ecx				#set counter to arrray size
	
	label_mystrncat_reach_dest_end:
	
		lodsb
		
		cmpb	$0, %al
		je	label_mystrncat_setup_for_append
		
	loop	label_mystrncat_reach_dest_end
	
	label_mystrncat_setup_for_append:
		
		#move one position back
		dec	%esi
		movl	%esi, %edi
		movl	12(%ebp), %esi			#soure bae address
		movl	16(%ebp), %ecx			#set counter to n
		
	label_mystrncat_append:
		
		lodsb
		stosb
		
		cmpb	$0, %al
		je	label_mystrncat_return
		
	loop	label_mystrncat_append
	
	label_mystrncat_return:
		
		movl	8(%ebp), %eax
		
		movl	%ebp, %esp
		popl	%ebp
		ret

