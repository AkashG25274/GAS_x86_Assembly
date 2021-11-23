
.EQU	LESS_THAN, 	1
.EQU	LESS_EQUAL, 	2
.EQU	GREATER_THAN, 	4
.EQU	GREATER_EQUAL, 	8
.EQU	EQUAL, 		16

.section .rodata
	
	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
	msg_main_print_less_than:
	.string	"%d is LESS THAN %d\n"
	
	msg_main_print_not_less_than:
	.string	"%d is NOT LESS THAN %d\n"
	
	msg_main_print_less_equal:
	.string	"%d is LESS THAN OR EQUAL to %d\n"
	
	msg_main_print_not_less_equal:
	.string	"%d is NOT LESS THAN OR EQUAL to %d\n"
	
	msg_main_print_greater_than:
	.string	"%d is GREATER THAN %d\n"
	
	msg_main_print_not_greater_than:
	.string	"%d is NOT GREATER THAN %d\n"
	
	msg_main_print_greater_equal:
	.string	"%d is GREATER THAN OR EQUAL to %d\n"
	
	msg_main_print_not_greater_equal:
	.string	"%d is NOT GREATER THAN OR EQUAL to %d\n"
	
	msg_main_print_equal:
	.string	"%d is EQUAL TO %d\n"
	
	msg_main_print_not_equal:
	.string	"%d is NOT EQUAL TO %d\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$9, %esp
	
	pushl	$msg_main_print
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax	#iNo1 address
	leal	-8(%ebp), %edx	#iNo2 address
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$12, %esp
	
	movl	-4(%ebp), %eax	#iNo1
	movl	-8(%ebp), %edx	#iNo2
	leal	-9(%ebp), %ecx	#cRelationalStatus address
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	compare
	addl	$12, %esp

	andb	$LESS_THAN, %al
	cmpb	$LESS_THAN, %al
	
	jne	label_main_print_not_less_than
		
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_less_than
	call	printf
	addl	$12, %esp
	
	jmp	label_main_check_less_equal
		
label_main_print_not_less_than:
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_not_less_than
	call	printf
	addl	$12, %esp

label_main_check_less_equal:
	
	movb	-9(%ebp), %al
	
	andb	$LESS_EQUAL, %al
	cmpb	$LESS_EQUAL, %al
	
	jne	label_main_print_not_less_equal
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_less_equal
	call	printf
	addl	$12, %esp
	
	jmp	label_main_check_greater_than
		
label_main_print_not_less_equal:
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_not_less_equal
	call	printf
	addl	$12, %esp

label_main_check_greater_than:

	movb	-9(%ebp), %al
	
	andb	$GREATER_THAN, %al
	cmpb	$GREATER_THAN, %al
	
	jne	label_main_print_not_greater_than
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_greater_than
	call	printf
	addl	$12, %esp
	
	jmp	label_main_check_greater_equal
	
label_main_print_not_greater_than:
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_not_greater_than
	call	printf
	addl	$12, %esp

label_main_check_greater_equal:

	movb	-9(%ebp), %al
	
	andb	$GREATER_EQUAL, %al
	cmpb	$GREATER_EQUAL, %al
	
	jne	label_main_print_not_greater_equal
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_greater_equal
	call	printf
	addl	$12, %esp
	
	jmp	label_main_check_equal
	
label_main_print_not_greater_equal:
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_not_greater_equal
	call	printf
	addl	$12, %esp

label_main_check_equal:

	movb	-9(%ebp), %al
	
	andb	$EQUAL, %al
	cmpb	$EQUAL, %al
	
	jne	label_main_print_not_equal
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_equal
	call	printf
	addl	$12, %esp
	
	jmp	label_main_exit
	
label_main_print_not_equal:
	
	pushl	-8(%ebp)
	pushl	-4(%ebp)
	pushl	$msg_main_print_not_equal
	call	printf
	addl	$12, %esp
	
label_main_exit:
	
	pushl	$0
	call	exit
	
######################### compare function ###################################
	
.globl	compare
.type	compare, @function

compare:
	pushl	%ebp
	movl	%esp, %ebp
	
	xorl	%eax, %eax
	
	movl	8(%ebp), %edx	#iNo1
	movl	12(%ebp), %ecx	#iNo2
	movl	16(%ebp), %ebx	#pcRelationalStatus address
	
	cmpl	%ecx, %edx
	
	jnl	label_compare_greater_than
	
	orb	$LESS_THAN, %al
	orb	$LESS_EQUAL, %al
	
	movb	%al, (%ebx)	#direct addressing
	
	jmp	label_compare_return
	
label_compare_greater_than:
	
	je	label_compare_equal
	
	orb	$GREATER_THAN, %al
	orb	$GREATER_EQUAL, %al
	
	movb	%al, (%ebx)	#direct addressing
	
	jmp	label_compare_return
		
label_compare_equal:
	
	orb	$EQUAL, %al
	orb	$LESS_EQUAL, %al
	orb	$GREATER_EQUAL, %al
	
	movb	%al, (%ebx)	#direct addressing
	
label_compare_return:
			
	movl	%ebp, %esp
	popl	%ebp
	ret

