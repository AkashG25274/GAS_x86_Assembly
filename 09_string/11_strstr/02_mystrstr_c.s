.section .rodata
	
	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_enter_substr:
	.string	"\n\nEnter String To Be Found:\t"
	
	msg_main_print_not_found:
	.string	"\n\nString Not Found\n"
	
	msg_main_print_found_at:
	.string	"\n\nString Is Found At %d Location\n"
	
	msg_main_print_found_in:
	.string	"\n\nString Found In '%s'\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	subl	$64, %esp
	
	movl	$msg_main_print_enter_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_substr, (%esp)
	call	printf
	
	leal	-40(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	leal	-20(%ebp), %eax
	leal	-40(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	mystrstr
	movl	%eax, -44(%ebp)
	
	cmpl	$0, %eax
	jne	label_main_found
	
	movl	$msg_main_print_not_found, (%esp)
	call	printf
	
	jmp	label_main_exit
	
	label_main_found:
				
		leal	-20(%ebp), %ebx
		subl	%ebx, %eax
		inc	%eax
		
		movl	$msg_main_print_found_at, (%esp)
		movl	%eax, 4(%esp)
		call	printf
		
		movl	-44(%ebp), %eax
		movl	$msg_main_print_found_in, (%esp)
		movl	%eax, 4(%esp)
		call	printf
					
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

########################################### mystrstr ############################################################

.globl	mystrstr
.type	mystrstr, @function

mystrstr:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %ebx				#base address of string in which to scan
	movl	%ebx, (%esp)
	call	mystrlen
	movl	%eax, -4(%ebp)				#total length of main string
	
	movl	12(%ebp), %ebx				#base address of string in which to scan
	movl	%ebx, (%esp)
	call	mystrlen
	movl	%eax, -8(%ebp)				#total length of substr
		
	movl	-4(%ebp), %ecx				#set counter for main string
	movl 	8(%ebp), %edi				#set base address to edi to scan
	movl	12(%ebp), %ebx				#base address of substring
	movl	%ebx, %esi				#set base address of substring to esi
		
	label_mystrstr_outer_loop:
		
		movl 	%ecx, %edx			#backup first counter
		movl	-8(%ebp), %ecx			#assigned substr count for inner loop
		
		label_mystrstr_inner_loop:
		
			lodsb
			scasb
			jne	label_mystrstr_reset_esi
				
		loop	label_mystrstr_inner_loop
		
		jmp	label_mystrstr_substr_found
				
		label_mystrstr_reset_esi:
		
			movl	%ebx, %esi
			movl	%edx, %ecx		#set backup count again for outer loop
			
	loop	label_mystrstr_outer_loop
	
	movl	$0, %eax
	jmp	label_mystrstr_return
	
	label_mystrstr_substr_found:
		
		subl	-8(%ebp), %edi
		movl	%edi, %eax
		
	label_mystrstr_return:
	
		movl	%ebp, %esp
		popl	%ebp
		ret

