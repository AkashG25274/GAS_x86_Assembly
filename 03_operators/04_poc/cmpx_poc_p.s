.section .rodata
	
	msg_main_jc:
	.string	"carry flag is ON\n"
	
	msg_main_jnc:
	.string	"carry flag is OFF\n"
	
	msg_main_js:
	.string	"sign flag is ON\n"
	
	msg_main_jns:
	.string	"sign flag is OFF\n"
	
	msg_main_jz:
	.string	"zero flag is ON\n"
	
	msg_main_jnz:
	.string	"zero flag is OFF\n"
	
	msg_main_jo:
	.string	"overflow flag is ON\n"
	
	msg_main_jno:
	.string	"overflow flag is OFF\n"
	
	msg_main_print:
	.string	"Enter two numbers:\n"
	
	msg_main_scan:
	.string	"%d%d"
	
.section .text

.globl	main
.type	main, @function

main:
		pushl	%ebp
		movl	%esp, %ebp
		
		subl	$8, %esp
	
		pushl	$msg_main_print
		call	printf
		addl	$4, %esp
	
		leal	-4(%ebp), %eax
		leal	-8(%ebp), %edx
		pushl	%edx
		pushl	%eax
		pushl	$msg_main_scan
		call	scanf
		addl	$12, %esp
	
		movl	-4(%ebp), %eax
		movl	-8(%ebp), %edx
	
		cmpl	%edx, %eax
	
		jc	label_print_carry_flag_on
	
		pushl	$msg_main_jnc
		call	printf
		addl	$4, %esp
	
		jmp	label_check_sign_flag
	
	label_print_carry_flag_on:
	
		pushl	$msg_main_jc
		call	printf
		addl	$4, %esp

	label_check_sign_flag:

		js	label_print_sign_flag_on
	
		pushl	msg_main_jns
		call 	printf
		addl	$4, %esp
	
		jmp	label_check_zero_flag
	
	label_print_sign_flag_on:

		pushl	$msg_main_js
		call	printf
		addl	$4, %esp
	
	label_check_zero_flag:
	
		jz	label_print_zero_flag_on
	
		pushl	$msg_main_jnz
		call	printf
		addl	$4, %esp
	
		jmp	label_check_overflow_flag
	
	label_print_zero_flag_on:

		pushl	$msg_main_jz
		call	printf
		addl	$4, %esp

	label_check_overflow_flag:
	
		jo	label_print_overflow_flag_on
	
		pushl	$msg_main_jno
		call	printf
		addl	$4, %esp
	
		jmp	label_call_exit
	
	label_print_overflow_flag_on:
		
		pushl	$msg_main_jo
		call	printf
		addl	$4, %esp
	
	label_call_exit:
	
		pushl	$0
		call	exit

