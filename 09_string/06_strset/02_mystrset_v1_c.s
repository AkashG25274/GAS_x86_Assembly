.section .rodata
	
	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_enter_char_to_set:
	.string	"\n\nEnter The Character To Set:\t"
	
	msg_main_scan:
	.string	"%c"
		
	msg_main_print_str:
	.string	"\n\nNow String Is:\t"
	
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
	
	movl	$msg_main_print_enter_char_to_set, (%esp)
	call	printf
	
	leal	-21(%ebp), %ebx
	movl	$msg_main_scan, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	leal	-20(%ebp), %eax
	movb	-21(%ebp), %dl
	movl	%eax, (%esp)
	movb	%dl, 4(%esp)
	call	mystrset
	
	movl	$msg_main_print_str, (%esp)
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit
	
##################################### mystrset ###################################################

.globl	mystrset
.type	mystrset, @function

mystrset:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %esi
	movl	%esi, %edi
	movb	12(%ebp), %dl
	movl	$20, %ecx
	
	label_mystrset_loop:
		
		lodsb
		
		cmpb	$0, %al
		je	label_mystrset_add_0
		
		movb	%dl, %al
		stosb
		
	loop	label_mystrset_loop
	
	label_mystrset_add_0:
			
		stosb
	
	movl	8(%ebp), %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

