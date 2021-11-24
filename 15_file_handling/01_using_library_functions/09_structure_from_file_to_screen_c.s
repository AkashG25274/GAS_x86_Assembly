.section .rodata
	
	file_path_to_read:
	.string	"07_student_structure_from_keyboard_to_file.txt"
	
	read_mode:
	.string	"r"
	
	file_open_fail_msg:
	.string	"\nCant Open File\n"
		
	scan_details_format_from_file:
	.string	"%s %d %f"
	
	msg_main_print_details:
	.string	"%s %d %f\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$80, %esp
	
	movl	$0, -4(%ebp)
	
	movl	$file_path_to_read, (%esp)
	movl	$read_mode, 4(%esp)
	call	fopen

	movl	%eax, -4(%ebp)
	
	cmpl	$0, %eax
	je	label_main_file_open_fail
	
	jmp	label_main_while_condition
	
	label_main_while_statement:
			
		leal	-52(%ebp), %eax
		movl	-12(%ebp), %edx
		
		finit
		flds	-8(%ebp)
		
		movl	$msg_main_print_details, (%esp)
		movl	%eax, 4(%esp)
		movl	%edx, 8(%esp)
		fstpl	12(%esp)
		call	printf
		
	label_main_while_condition:
		
		movl	-4(%ebp), %eax
		leal	-52(%ebp), %edx
		leal	-12(%ebp), %ecx
		leal	-8(%ebp), %ebx
		
		movl	%eax, (%esp)
		movl	$scan_details_format_from_file, 4(%esp)
		movl	%edx, 8(%esp)
		movl	%ecx, 12(%esp)
		movl	%ebx, 16(%esp)
		call	fscanf
		
		cmpl	$-1, %eax
		jne	label_main_while_statement
		
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

