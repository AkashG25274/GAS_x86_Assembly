.section .rodata
	
	file_path_to_write:
	.string	"07_student_structure_from_keyboard_to_file.txt"
	
	write_mode:
	.string	"w"
	
	file_open_fail_msg:
	.string	"\nCant Open File\n"
	
	msg_main_print_enter_details:
	.string	"\n\nEnter name, roll no. and percentage:\n"
	
	msg_main_scan_details:
	.string	"%s %d %f"
	
	print_student_details_in_file:
	.string	"%s %d %f\n"
	
	msg_main_ask_for_another_record:
	.string	"\nAdd another record (Y/N)"
	
	msg_main_scan_choice:
	.string	"%c%c"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$80, %esp
	
	movl	$0, -4(%ebp)
	movb	$'Y', -5(%ebp)
	
	movl	$file_path_to_write, (%esp)
	movl	$write_mode, 4(%esp)
	call	fopen

	movl	%eax, -4(%ebp)
		
	cmpl	$0, %eax
	je	label_main_file_open_fail

	jmp	label_main_while_condition
	
	label_main_while_statement:
		
		movl	$msg_main_print_enter_details, (%esp)
		call	printf
		
		leal	-53(%ebp), %eax
		leal	-13(%ebp), %edx
		leal	-9(%ebp), %ecx
		
		movl	$msg_main_scan_details, (%esp)
		movl	%eax, 4(%esp)
		movl	%edx, 8(%esp)
		movl	%ecx, 12(%esp)
		call	scanf
		
		movl	-4(%ebp), %eax
		leal	-53(%ebp), %edx
		movl	-13(%ebp), %ecx
	
		finit
		flds	-9(%ebp)
		
		movl	%eax, (%esp)
		movl	$print_student_details_in_file, 4(%esp)
		movl	%edx, 8(%esp)
		movl	%ecx, 12(%esp)
		fstpl	16(%esp)
		call	fprintf
		
		movl	$msg_main_ask_for_another_record, (%esp)
		call	printf
		
		leal	-54(%ebp), %eax
		leal	-5(%ebp), %edx
		
		movl	$msg_main_scan_choice, (%esp)
		movl	%eax, 4(%esp)
		movl	%edx, 8(%esp)
		call	scanf
		
	label_main_while_condition:
		
		movb	-5(%ebp), %al
		
		cmpb	$'Y', %al
		je	label_main_while_statement
		
		cmpb	$'y', %al
		je	label_main_while_statement
			
	label_main_exit:
	
		movl	-4(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
	
		movl	$0, -4(%ebp)
	
		movl	$0, (%esp)
		call	exit
	
	label_main_file_open_fail:
		
		movl	$file_open_fail_msg, (%esp)
		call	printf
		
		movl	$-1, (%esp)
		call	exit

