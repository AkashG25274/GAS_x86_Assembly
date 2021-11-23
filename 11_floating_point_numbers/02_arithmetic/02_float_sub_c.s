.section .rodata
	
	msg_main_print_numbers:
	.string	"fNo1 = %f\nfNo2 = %f\n"
	
	msg_main_print_ans1:
	.string	"fAns1 = %f\n"
	
	msg_main_print_ans2:
	.string	"fAns2 = %f\n"
	
	msg_main_print_ans3:
	.string	"fAns3 = %f\n"	
	
	int_literal:
	.int	5

.section .data
	
	.globl	fNo1
	.type	fNo1, @object
	.size	fNo1, 4
	.align	4
	
	fNo1:
	.float	10.22
	
	.globl	fNo2
	.type	fNo2, @object
	.size	fNo2, 4
	.align	4
	
	fNo2:
	.float	20.22

.section .bss

	.comm	fAns1, 4, 4
	
	.comm	fAns2, 4, 4

	.comm	fAns3, 4, 4

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	finit
	
	flds	fNo2
	flds	fNo1
	
	movl	$msg_main_print_numbers, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf
	
	flds	fNo2
	fsubs	fNo1
	fstps	fAns1
	
	flds	fNo1
	fsubs	fNo2
	fstps	fAns2
	
	flds	fNo1
	fisubs	int_literal
	fsts	fAns3
	
	flds	fAns2
	flds	fAns1
	
	movl	$msg_main_print_ans1, (%esp)
	fstpl	4(%esp)
	call	printf
	
	movl	$msg_main_print_ans2, (%esp)
	fstpl	4(%esp)
	call	printf
	
	movl	$msg_main_print_ans3, (%esp)
	fstpl	4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit

