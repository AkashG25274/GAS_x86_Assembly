.section .rodata
	
	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print_sum:
	.string	"Sum is %d\n"
	
	msg_main_print_diff:
	.string	"Difference is %d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax		#iNo1 address
	leal	-8(%ebp), %edx		#iNo2 address
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	movl	-4(%ebp), %eax		#iNo1
	movl	-8(%ebp), %edx		#iNo2
	leal	-12(%ebp), %ecx		#iSum address
	leal	-16(%ebp), %ebx		#iDiff address
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	SumDiff
	addl	$16, %esp
	
	pushl	-12(%ebp)
	pushl	$msg_main_print_sum
	call	printf
	addl	$8, %esp
	
	pushl	-16(%ebp)
	pushl	$msg_main_print_diff
	call	printf
	addl	$8, %esp
	
	pushl	$0
	call	exit

##################################### SumDiff function ###############################

.globl	SumDiff
.type	SumDiff, @function

SumDiff:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax		#iNo1
	movl	12(%ebp), %edx		#iNo2
	
	addl	%edx, %eax
	
	movl	16(%ebp), %ebx		#iSum address
	
	movl	%eax, (%ebx)		#Direct addressing
	
	movl	8(%ebp), %eax		#iNo1
	
	subl	%edx, %eax
	
	movl	20(%ebp), %ebx		#iDiff address
	movl	%eax, (%ebx)		#Direct addressing
	
	movl	%ebp, %esp
	popl	%ebp
	ret

