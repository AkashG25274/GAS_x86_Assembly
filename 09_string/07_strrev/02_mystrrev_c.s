.section .rodata

	msg_main_print_enter_str:
	.string	"\n\nEnter The String:\t"
	
	msg_main_print_rev_str:
	.string	"\n\nReverse String Is:\t"
	
	msg_main_print_debug:
	.string	"address:%d\n"
		
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
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	mystrrev
	
	movl	$msg_main_print_rev_str, (%esp)	
	call	printf
	
	leal	-20(%ebp), %ebx
	movl	%ebx, (%esp)
	call	puts
	
	movl	$0, (%esp)
	call	exit

############################################# mystrrev #####################################################

.globl	mystrrev
.type	mystrrev, @function

mystrrev:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
		
	movl	8(%ebp), %ebx			#base address of source string
		
	movl	%ebx, (%esp)
	call	mystrlen
	movl	%eax, %ebx
	dec	%ebx
		
	xorl	%edx, %edx
	movl	$2, %ecx
	divl	%ecx				#%eax, hold length of string
	movl	%eax, %ecx			#set counter, length/2
		
	movl	8(%ebp), %esi			#base address of source string
	movl	%esi, %edi
	addl	%ebx, %edi			#last char address
	
	label_strrev_loop:
		
		movb	(%esi), %al
		movb	(%edi), %dl
		movb	%al, (%edi)
		movb	%dl, (%esi)
						 
		inc	%esi
		dec	%edi
				
	loop	label_strrev_loop
	
	movl	8(%ebp), %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

