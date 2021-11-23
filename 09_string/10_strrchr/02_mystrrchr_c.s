.section .rodata
	
	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_enter_char:
	.string	"\n\nEnter Character To Be Found:\t"
	
	msg_main_scan_char:
	.string	"%c"
	
	msg_main_print_char_not_found:
	.string	"\n\nCharacter Is Not Found\n"
	
	msg_main_print_char_found:
	.string	"\n\nCharacter Is Found At %d Location\n"
		
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
	
	movl	$msg_main_print_enter_char, (%esp)
	call	printf
	
	leal	-21(%ebp), %ebx
	movl	$msg_main_scan_char, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	leal	-20(%ebp), %eax
	movb	-21(%ebp), %dl
	movl	%eax, (%esp)
	movb	%dl, 4(%esp)
	call	mystrrchr
	
	cmpl	$0, %eax
	jne	label_main_print_found
	
		movl	$msg_main_print_char_not_found, (%esp)
		call	printf
		
		jmp	label_main_exit
				
	label_main_print_found:
		
		leal	-20(%ebp), %edx
		subl	%edx, %eax
		inc	%eax
		
		movl	$msg_main_print_char_found, (%esp)
		movl	%eax, 4(%esp)
		call	printf		
		
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

######################################################## mystrrchr #################################################

.globl	mystrrchr
.type	mytrrchr, @function

mystrrchr:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	%eax, %ecx				#set counter
	dec	%eax
	movl	8(%ebp), %edi				#base address of string
	addl	%eax, %edi				#address of last character
	movb	12(%ebp), %al				#set char to be serch
	
	std						#set direction flag
	
	repne	scasb
	
	cld						#clear direction flag
	je	label_mystrrchr_found
	
	movl	$0, %eax
	jmp	label_mystrrchr_return
	
	label_mystrrchr_found:
			
		inc	%edi
		movl	%edi, %eax
			
	label_mystrrchr_return:
		
		movl	%ebp, %esp
		popl	%ebp
		ret

