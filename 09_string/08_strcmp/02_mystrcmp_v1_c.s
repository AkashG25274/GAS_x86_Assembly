.section .rodata
	
	msg_main_print_enter_str1:
	.string	"\n\nEnter String1:\t"
	
	msg_main_print_enter_str2:
	.string	"\n\nEnter String2:\t"
	
	msg_main_print_same:
	.string	"\n\nBoth Strings Are Same\n"
	
	msg_main_print_different:
	.string	"\n\nBoth Strings Are Diffrent\n"
		
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$48, %esp
	
	movl	$msg_main_print_enter_str1, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	movl	$msg_main_print_enter_str2, (%esp)
	call	printf
	
	leal	-40(%ebp), %ebx
	movl	%ebx, (%esp)
	call	gets
	
	leal	-20(%ebp), %eax
	leal	-40(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	mystrcmp
	
	cmpl	$0, %eax
	jne	label_main_print_different
	
	movl	$msg_main_print_same, (%esp)
	call	printf
	
	jmp	label_main_exit
	
	label_main_print_different:
		
		movl	$msg_main_print_different, (%esp)
		call	printf
	
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

########################################### mystrcmp ##################################################

.globl	mystrcmp
.type	mystrcmp, @function

mystrcmp:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
		
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	mystrlen
	addl	$1, %eax
		
	movl	%eax, %ecx			#set counter
	movl	8(%ebp), %esi			#base address string1
	movl	12(%ebp), %edi			#base address string2
	
	repe	cmpsb
	
	dec 	%esi
	dec	%edi
	
	lodsb
	movb	%al, %dl
	
	movl	%edi, %esi
	lodsb
	
	subb	%al, %dl
	movsx	%dl, %eax
			
	movl	%ebp, %esp
	popl	%ebp
	ret

