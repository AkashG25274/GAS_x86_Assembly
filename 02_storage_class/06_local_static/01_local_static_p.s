.section .rodata
	
	msg_main_print:
	.string	"iNo1=%d\tiNo2=%d\n"

.section .data
	
	.globl	iNo1
	.type	iNo1, @object
	.size	iNo1, 4
	.align	4
	
	iNo1:
	.int	10

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	movl	$0, -4(%ebp)
	
	jmp	label_for_condition
	
label_for_statement:
	
	call	fun
	
	addl	$1, -4(%ebp)
	
label_for_condition:
	
	movl	-4(%ebp), %eax
	
	cmpl	$3, %eax
	
	jl	label_for_statement

	pushl	$0
	call	exit

############################# fun function ################################
	
.globl	fun
.type	fun, @function

fun:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$4, %esp
	
	movl	$10, -4(%ebp)
	
	addl	$1, iNo1
	
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -4(%ebp)
	
	pushl	%eax
	pushl	iNo1
	pushl	$msg_main_print
	call	printf
	addl	$12, %esp
	
	movl	%ebp, %esp
	popl	%ebp
	ret

