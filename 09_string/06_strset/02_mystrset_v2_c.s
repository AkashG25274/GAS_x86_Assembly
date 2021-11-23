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
	
	subl	$16, %esp
	
	movl	8(%ebp), %ebx				#sourcce string base address
	movl	%ebx, (%esp)
	call	mystrlen
	
	movl	%eax, %ecx				#set counter
	movl	8(%ebp), %edi				#set destination
	movb	12(%ebp), %al				#set character
	
	rep	stosb
	
	movb	$0, %al
	stosb
	
	movl	8(%ebp), %eax				#return string
	
	movl	%ebp, %esp
	popl	%ebp
	ret

