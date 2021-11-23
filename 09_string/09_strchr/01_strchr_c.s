.section .rodata
	
	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_enter_char:
	.string	"\n\nEnter Character To Be Found:\t"
	
	msg_main_scan:
	.string	"%c"
	
	msg_main_print_not_found:
	.string	"\n\nCharacter Is Not Found\n"
	
	msg_main_print_found:
	.string	"\n\nCharacter Is Found At %d Location\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$msg_main_print_enter_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_char, (%esp)
	call	printf
	
	leal	-21(%ebp), %ebx
	movl	$msg_main_scan, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	leal	-20(%ebp), %eax
	movb	-21(%ebp), %dl
	movl	%eax, (%esp)
	movb	%dl, 4(%esp)
	call	strchr
	
	cmpl	$0, %eax
	jne	label_main_print_found
	
	movl	$msg_main_print_not_found, (%esp)
	call	printf
	
	jmp	label_main_exit
	
	label_main_print_found:
		
		leal	-20(%ebp), %edx
		subl	%edx, %eax
		inc	%eax
		
		movl	$msg_main_print_found, (%esp)
		movl	%eax, 4(%esp)
		call	printf
	
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

