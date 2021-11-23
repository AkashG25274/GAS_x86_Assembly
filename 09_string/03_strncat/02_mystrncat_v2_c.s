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
	
	msg_main_print_debug:
	.string	"character:%d\n"
		
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

################################### mystrncat #####################################################

.globl	mystrncat
.type	mystrncat, @function

mystrncat:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %edx				#dest base address
	movl	%edx, (%esp)
	call	mystrlen
	
	movl	8(%ebp), %edx				#dest base address
	addl	%eax, %edx				#added length to dest address to move to the \0 position
	movl	%edx, %edi				#dest set
	
	movl	12(%ebp), %ebx				#source base address
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	12(%ebp), %esi				#set source
	movl	16(%ebp), %ecx				#n
	
	cmpl	%eax, %ecx
	jg	label_mystrncat_set_new_counter

	jmp	label_mystrncat_append
	
	label_mystrncat_set_new_counter:
		
		movl	%eax, %ecx
	
	label_mystrncat_append:
		
		rep	movsb
	
	movb	$0, %al
	stosb
		
	movl	8(%ebp), %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

