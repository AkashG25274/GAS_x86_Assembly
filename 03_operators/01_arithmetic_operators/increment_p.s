.section .rodata

	msg_main_print:
	.string	"iNo1 = %d\niNo2 = %d\niAns1 = %d\niAns2 = %d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$10, -4(%ebp)
	movl	$20, -8(%ebp)
	
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	movl	%eax, -12(%ebp)
	
	movl	-8(%ebp), %eax
	movl	%eax, -16(%ebp)
	addl	$1, %eax
	movl	%eax, -8(%ebp)
	
	#At this point %eax holds valus of iNo2
	
	movl	-4(%ebp), %edx	#iNo1
	movl	-12(%ebp), %ecx	#iAns1
	movl	-16(%ebp), %ebx	#iAns2
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	pushl	%edx
	pushl	$msg_main_print
	call	printf
	addl	$20, %esp
	
	pushl	$0
	call	exit

