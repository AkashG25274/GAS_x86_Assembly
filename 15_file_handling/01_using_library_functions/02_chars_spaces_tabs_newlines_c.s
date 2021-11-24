.section .rodata
	
	file_path_to_read:
	.string	"02_chars_spaces_tabs_newlines.txt"
	
	read_mode:
	.string	"r"
	
	file_opening_error_message:
	.string	"\nCant Open The File.\n"
	
	msg_main_print_total_chars:
	.string	"\nNo of characters are %d\n"
	
	msg_main_print_total_spaces:
	.string	"No of spaces are %d\n"
	
	msg_main_print_total_tabs:
	.string	"No of tabs are %d\n"
	
	msg_main_print_total_lines:
	.string	"No of lines are %d\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$32, %esp
	
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	
	movl	$file_path_to_read, (%esp)
	movl	$read_mode, 4(%esp)
	call	fopen
	
	movl	%eax, -4(%ebp)
	
	cmpl	$0, %eax
	je	label_main_file_open_fail
	
	label_main_while_statement_infinite:
		
		movl	-4(%ebp), %ebx
		xorl	%eax, %eax
		
		movl	%ebx, (%esp)
		call	fgetc
		
		cmpl	$-1, %eax
		je	label_main_print_result_and_exit
		
		incl	-8(%ebp)
			
		cmpl	$32, %eax					#check for space
		jne	label_main_check_tab
		
		incl	-12(%ebp)
		jmp	label_main_while_statement_infinite
		
		label_main_check_tab:
			
			cmpl	$9, %eax				#check for tab
			jne	label_main_check_newline
			
			incl	-16(%ebp)
			jmp	label_main_while_statement_infinite
			
		label_main_check_newline:
			
			cmpl	$10, %eax				#check for newline
			jne	label_main_while_statement_infinite
			
			incl 	-20(%ebp)
			
	jmp	label_main_while_statement_infinite
			
	label_main_print_result_and_exit:
		
		movl	-4(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
		
		movl	$0, -4(%ebp)
		
		movl	-8(%ebp), %eax
		movl	$msg_main_print_total_chars, (%esp)
		movl	%eax, 4(%esp)
		call	printf
		
		movl	-12(%ebp), %eax
		movl	$msg_main_print_total_spaces, (%esp)
		movl	%eax, 4(%esp)
		call	printf
		
		movl	-16(%ebp), %eax
		movl	$msg_main_print_total_tabs, (%esp)
		movl	%eax, 4(%esp)
		call	printf
	
		movl	-20(%ebp), %eax
		movl	$msg_main_print_total_lines, (%esp)
		movl	%eax, 4(%esp)
		call	printf
		
		movl	$0, (%esp)
		call	exit
	
	label_main_file_open_fail:
		
		movl	$file_opening_error_message, (%esp)
		call	printf
		
		movl	$-1, (%esp)
		call	exit

