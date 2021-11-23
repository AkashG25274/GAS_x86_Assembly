.section .rodata

	msg_main_print_enter_dest:
	.string	"\n\nEnter Destination String:\t"
	
	msg_main_print_enter_source:
	.string	"\n\nEnter Source String:\t"
	
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

########################### mystrcat ##################################################

.globl	mystrcat
.type	mystrcat, @function

mystrcat:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %esi			#destination string base address
	movl	$40, %ecx			#hardcoded 40 as dest array size is 40
	
	label_mystrcat_loop_instruction:
		
		lodsb
		
		cmpb	$0, %al
		je	label_mystrcat_setup_for_append
				
	loop	label_mystrcat_loop_instruction
	
	label_mystrcat_setup_for_append:
		
		dec 	%esi
		movl	%esi, %edi		#now write in dest string, hance moving %esi to %edi
		movl	12(%ebp), %esi		#source string base address
		movl	$20, %ecx		#hardcoded 20 as source array size is 20		
		
	label_mystrcat_loop_instruction_append:
		
		lodsb
		stosb
		
		cmpb	$0, %al
		je	label_mystrcat_return
		
	loop	label_mystrcat_loop_instruction_append
		
	label_mystrcat_return:
	
		movl	8(%ebp), %eax		#dest string base addresss
			
		movl	%ebp, %esp
		popl	%ebp
		ret

