.section .rodata

	msg_main_print_enter_dest:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
	msg_main_print_concatenated_string:
	.string	"\n\nConcatenated String Is:\t"
	
	debug_print_address:
	.string	"Address:%d\n"
	
	debug_print_length:
	.string	"Length:%d\n"
		
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
	
	leal	-60(%ebp), %eax				#dest
	leal	-20(%ebp), %edx				#source
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	mystrcat
	
	movl	$msg_main_print_concatenated_string, (%esp)
	call	printf
	
	leal	-60(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

##################################### mystrcat ########################################################

.globl	mystrcat
.type	mystrcat, @function

mystrcat:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %edx				#base address of destination string
	movl	%edx, (%esp)
	call	mystrlen
	
	movl	8(%ebp), %edx				#base address of destination string
	addl	%eax, %edx				#added count to address, to move to the location to put characters
	movl	%edx, %edi				#set destination
	
	movl	12(%ebp), %ebx				#base address of source string
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	12(%ebp), %ebx				#base address of source string
	addl	$1, %eax
	movl	%eax, %ecx				#set counter for rep	
	movl	%ebx, %esi				#set source
	
	rep	movsb
	
	movl	8(%ebp), %eax				#returning dest base address
	
	movl	%ebp, %esp
	popl	%ebp
	ret

