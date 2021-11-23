.section .rodata
	
	msg_main_print_obj1:
	.string	"obj1 is\n"
	
	msg_main_print_obj_contents:
	.string	"chChar is %c, iNo is %d, shiNo is %hd\n\n"
	
	msg_main_print_obj2:
	.string	"obj2 is\n"
	
	msg_main_print_obj3:
	.string	"obj3 is\n"
	
	msg_main_print_obj1_obj2_comparison:
	.string	"obj1 & obj2 comparison is "
	
	msg_main_print_equal:
	.string	"equal\n"
	
	msg_main_print_not_equal:
	.string	"not equal\n"
	
	msg_main_print_obj2_obj3_comparison:
	.string	"obj2 & obj3 comparison is "
	
.section .data
	
	.globl	obj1
	.type	obj1, @object
	.size	obj1, 12
	.align	4
	
	obj1:
		.ascii	"A"
		.zero	3
		.int	10
		.value	20
		.zero	2

.section .text

.globl 	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$24, %esp
	
	leal	-12(%ebp), %ebx
	movb	$'B', (%ebx)
	movl	$30, 4(%ebx)
	movw	$40, 8(%ebx)
	
	leal	-24(%ebp), %ebx
	movb	$'B', (%ebx)
	movl	$30, 4(%ebx)
	movw	$40, 8(%ebx)
	
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
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	pushl	$msg_main_print_obj2
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw 	8(%ebx), %cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	pushl	$msg_main_print_obj3
	call	printf
	addl	$4, %esp
	
	leal	-24(%ebp), %ebx
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	pushl	$msg_main_print_obj1_obj2_comparison
	call 	printf
	addl	$4, %esp
	
	movl	$obj1, %eax		#obj1 address
	leal	-12(%ebp), %edx		#obj2 address
	
	movb	(%eax), %cl		#obj1.chChar
	movb	(%edx), %bl		#obj2.chChar
	
	cmpb	%bl, %cl
	
	jne	label_main_print_obj1_obj2_not_equal
	
	movl	4(%eax), %ecx		#obj1.iNo
	movl	4(%edx), %ebx		#obj2.iNo
	
	cmpl	%ebx, %ecx
	
	jne	label_main_print_obj1_obj2_not_equal
	
	movw	8(%eax), %cx		#obj1.shiNo
	movw	8(%edx), %bx		#obj2.shiNo
	
	cmpw	%bx, %cx
	
	jne	label_main_print_obj1_obj2_not_equal
	
	pushl	$msg_main_print_equal
	call	printf
	addl	$4, %esp
	
	jmp	label_main_compare_obj2_obj3
	
label_main_print_obj1_obj2_not_equal:
	
	pushl	$msg_main_print_not_equal
	call	printf
	addl	$4, %esp

label_main_compare_obj2_obj3:
	
	pushl	$msg_main_print_obj2_obj3_comparison
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %eax		#obj2 address
	leal	-24(%ebp), %edx		#obj3 address
	
	movb	(%eax), %cl		#obj2.chChar
	movb	(%edx), %bl		#obj3.chChar
	
	cmpb	%bl, %cl
	
	jne	label_main_print_obj2_obj3_not_equal
	
	movl	4(%eax), %ecx		#obj2.iNo
	movl	4(%edx), %ebx		#obj3.iNo
	
	cmpl	%ebx, %ecx
	
	jne	label_main_print_obj2_obj3_not_equal
	
	movw	8(%eax), %cx		#obj2.shiNo
	movw	8(%edx), %bx		#obj3.shiNo
	
	cmpw	%bx, %cx
	
	jne	label_main_print_obj2_obj3_not_equal
	
	pushl	$msg_main_print_equal
	call	printf
	addl	$4, %esp

	jmp	label_main_exit
		
label_main_print_obj2_obj3_not_equal:
	
	pushl	$msg_main_print_not_equal
	call	printf
	addl	$4, %esp

label_main_exit:

	pushl	$0
	call	exit

