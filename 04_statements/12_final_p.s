.section .rodata

	msg_main_print_choices:
	.string	"\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n"
	
	msg_main_print_enter_choice:
	.string	"Enter your choice:\n"
	
	msg_main_scan_choice:
	.string	"%d"
	
	msg_main_print_enter_numbers:
	.string	"Enter two numbers:\n"
	
	msg_main_scan_numbers:
	.string	"%d%d"
	
	msg_main_print_valid_choice:
	.string	"Enter valid choice.\n"
	
	msg_main_print_answer:
	.string	"Answer is %d\n"
	
	msg_main_print_ask_for_more_choices:
	.string	"Do you want to enter more choice?(1/0)\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp

	subl	$12, %esp
	
label_main_do_statement:
	
	pushl	$msg_main_print_choices
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print_enter_choice
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_choice
	call	scanf
	addl	$8, %esp
	
	movl	-12(%ebp), %eax		#iChoice
	
	cmpl	$0, %eax
	
	jng	label_main_switch_statement
	
	cmpl	$5, %eax
	
	jnl	label_main_switch_statement
	
	pushl	$msg_main_print_enter_numbers
	call	printf
	addl	$4, %esp
	
	leal	-4(%ebp), %eax		#iNo1 address
	leal	-8(%ebp), %edx		#iNo2 address
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_numbers
	call	scanf
	addl	$12, %esp
	
	movl	-4(%ebp), %edx		#iNo1
	movl	-8(%ebp), %ecx		#iNo2
	
label_main_switch_statement:

	movl	-12(%ebp), %eax		#iChoice
	
	cmpl	$1, %eax
	je	label_main_addition
	
	cmpl	$2, %eax
	je	label_main_subtraction
	
	cmpl	$3, %eax
	je	label_main_multiplication
	
	cmpl	$4, %eax
	je	label_main_division
	
	cmpl	$5, %eax
	je	label_main_exit
	
	jmp	label_main_switch_default

label_main_addition:
	
	pushl	%ecx			#iNo2
	pushl	%edx			#iNo1
	call	Addition
	addl	$8, %esp
	
	jmp	label_main_print_answer
	
label_main_subtraction:

	pushl	%ecx			#iNo2
	pushl	%edx			#iNo1
	call	Subtraction
	addl	$8, %esp
	
	jmp	label_main_print_answer

label_main_multiplication:

	pushl	%ecx			#iNo2
	pushl	%edx			#iNo1
	call	Multiplication
	addl	$8, %esp
	
	jmp	label_main_print_answer
	
label_main_division:

	pushl	%ecx			#iNo2
	pushl	%edx			#iNo1
	call	Division	
	addl	$8, %esp
	
	jmp	label_main_print_answer

label_main_switch_default:
	
	pushl	$msg_main_print_valid_choice
	call	printf
	addl	$4, %esp
	
	jmp	label_main_do_statement

label_main_print_answer:
	
	pushl	%eax			#iAns
	pushl	$msg_main_print_answer
	call	printf
	addl	$8, %esp
	
	pushl	$msg_main_print_ask_for_more_choices
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx		#iChoice address
	pushl	%ebx
	pushl	$msg_main_scan_choice
	call	scanf
	addl	$8, %esp
	
	movl	-12(%ebp), %eax		#iChoice
	
	cmpl	$1, %eax
	
	je	label_main_do_statement
	
label_main_exit:

	pushl	$0
	call	exit

###################### Addition function ###################

.globl	Addition
.type	Addition, @function

Addition:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax		#iNo1
	movl	12(%ebp), %edx		#iNo2
	
	addl	%edx, %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

##################### Subtraction function ########################

.globl	Subtraction
.type	Subtraction, @function

Subtraction:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax		#iNo1
	movl	12(%ebp), %edx		#iNo2
	
	subl	%edx, %eax
	
	movl	%ebp, %esp
	popl	%ebp
	ret

#################### Multiplication function ######################

.globl	Multiplication
.type	Multiplication, @function

Multiplication:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %eax		#iNo1
	movl	12(%ebp), %ecx		#iNo2
	
	mull	%ecx
	
	movl	%ebp, %esp
	popl	%ebp
	ret

################### Division function #############################

.globl	Division
.type	Division, @function

Division:
	pushl	%ebp
	movl	%esp, %ebp
	
	xorl	%edx, %edx
	
	movl	8(%ebp), %eax		#iNo1
	movl	12(%ebp), %ecx		#iNo2
	
	divl	%ecx
	
	movl	%ebp, %esp
	popl	%ebp
	ret

