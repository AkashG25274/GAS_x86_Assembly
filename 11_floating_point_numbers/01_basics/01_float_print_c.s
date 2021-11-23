.section .rodata
	
	msg_main_print1:
	.string	"fNo1=%f\tfNo2=%f\n"
	
	msg_main_print2:
	.string	"dNo1=%lf\tdNo2=%lf\n"
		
.section .data
	
	.globl	fNo1
	.type	fNo1, @object
	.size	fNo1, 4
	.align	4
	
	fNo1:
	.float	57.33
	
	.globl	dNo1
	.type	dNo1, @object
	.size	dNo1, 8
	.align	4
	
	dNo1:
	.double	10999.88856
	
.section .bss
	
	.comm	fNo2, 4, 4
	
	.comm	dNo2, 4, 4
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	### First attempt -- not working (no FPU instructions) ###
	
	#movl	fNo1, %eax
	#movl	fNo2, %edx
	#movl	$msg_main_print1, (%esp)
	#movl	%eax, 4(%esp)
	#movl	%edx, 8(%esp)
	#call	printf
	
	### Second attempt -- not working (as printf requires 8 bytes) ###
	
	#flds	fNo2
	#flds	fNo1
	
	#movl	$msg_main_print1, (%esp)
	#fstps	4(%esp)
	#fstps	8(%esp)
	#call	printf

	### Third attempt -- working ###
	
	flds	fNo2
	flds	fNo1
	
	movl	$msg_main_print1, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf
	
	fldl	dNo2
	fldl	dNo1
	
	### method 1 -- working ###
	
	movl	$msg_main_print2, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf
	
	### method 2 ###
	
	#movl	dNo1, %eax
	#movl	dNo1+4, %edx
	#movl	dNo2, %ecx
	#movl	dNo2+4, %ebx
	
	#movl	$msg_main_print2, (%esp)
	#movl	%eax, 4(%esp)
	#movl	%edx, 8(%esp)
	#movl	%ecx, 12(%esp)
	#movl	%ebx, 16(%esp)
	#call	printf
	 	
	movl	fNo1, %eax
	movl	fNo2, %edx
	movl	%edx, fNo1
	movl	%eax, fNo2
	
	fldl	dNo2
	fldl	dNo1
	fstpl	dNo2
	fstpl	dNo1
		
	flds	fNo2
	flds	fNo1
	
	movl	$msg_main_print1, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf
	
	fldl	dNo2
	fldl	dNo1
	
	movl	$msg_main_print2, (%esp)
	fstpl	4(%esp)
	fstpl	12(%esp)
	call	printf
		
	movl	$0, (%esp)
	call	exit

