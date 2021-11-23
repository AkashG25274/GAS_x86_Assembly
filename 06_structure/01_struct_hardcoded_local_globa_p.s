.section .rodata
	
	msg_main_print_obj1:
	.string	"obj1 is\n"
	
	msg_main_print_obj1_contents:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n\n"
	
	msg_main_print_obj2:
	.string	"obj2 is\n"
	
	msg_main_print_obj2_contents:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n"
	
.section .data
	
	.globl	obj1
	.type	obj1, @object
	.size	obj1, 12	#size w.r.t. padding bytes
	.align	4
	
	obj1:
		.ascii	"A"
		.zero	3	#padding bytes
		.int	10
		.value	20
		.zero	2	#padding bytes
	
.section .text

.globl	main
.type	main, @function

main:
	pushl 	%ebp
	movl	%esp, %ebp
	
	subl	$12, %esp

	movb	$'B', -12(%ebp)
	movl	$30, -8(%ebp)
	movw	$40, -4(%ebp)
	
	#obj1 printing
	
	pushl	$msg_main_print_obj1
	call	printf
	addl	$4, %esp
	
	movl	$obj1, %ebx
	
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj1_contents
	call	printf
	addl	$16, %esp
	
	#obj2 printing
	
	pushl	$msg_main_print_obj2
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj2_contents
	call	printf
	addl	$16, %esp
	
	pushl	$0
	call	exit

