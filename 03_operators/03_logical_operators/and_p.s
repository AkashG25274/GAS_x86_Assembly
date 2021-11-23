.section .rodata

	msg_main_print1:
	.string	"Enter three numbers:\t"
	
	msg_main_scan:
	.string	"%d%d%d"
	
	msg_main_print2:
	.string	"iNo1 is %d\niNo2 is %d\niNo3 is %d\niAns is %d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	pushl	$msg_main_print1
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax
	leal	-8(%ebp), %edx
	leal 	-12(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$16, %esp
	
	movl	-4(%ebp), %eax
	
	cmpl	$0, %eax
	
	je	label_and_result_false

	movl	-8(%ebp), %eax
	addl	$1, -8(%ebp)
			
	cmpl	$0, %eax
	
	je	label_and_result_false
	
	movl	-12(%ebp), %eax
	addl	$1, -12(%ebp)
	
	cmpl	$0, %eax
	je	label_and_result_false
	movl	$1, -16(%ebp)
	
	jmp	label_print_result
	
label_and_result_false:
	
	movl	$0, -16(%ebp)
	
label_print_result:

	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	-12(%ebp), %ecx
	movl	-16(%ebp), %ebx
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print2
	call	printf
	addl	$20, %esp
	
	pushl	$0
	call	exit

