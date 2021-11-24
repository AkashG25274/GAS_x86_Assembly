.section .rodata
	
	file_path_to_write:
	.string	"05_keyboard_to_text_file.txt"
	
	write_mode:
	.string	"w"
	
	file_open_fail_msg:
	.string	"\nCant Open File\n"
	
	msg_main_print_enter_strings:
	.string	"\nEnter Strings:\n"
	
	newline_character:
	.string	"\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$64, %esp
	
	movl	$0, -4(%ebp)
	
	movl	$file_path_to_write, (%esp)
	movl	$write_mode, 4(%esp)
	call	fopen
	
	movl	%eax, -4(%ebp)
	
	cmpl	$0, %eax
	je	label_main_file_open_fail
	
	movl	$msg_main_print_enter_strings, (%esp)
	call	printf
	
	jmp	label_main_while_condition
	
	label_main_while_statement:
		
		leal	-54(%ebp), %eax
		movl	-4(%ebp), %edx
		
		movl	%eax, (%esp)
		movl	%edx, 4(%esp)
		call	fputs
		
		movl	-4(%ebp), %ebx
		
		movl	$newline_character, (%esp)
		movl	%ebx, 4(%esp)
		call	fputs
	
	label_main_while_condition:
		
		leal	-54(%ebp), %ebx
		movl	%ebx, (%esp)
		call	gets
		
		movl	%eax, (%esp)
		call	strlen
		
		cmpl	$0, %eax
		jg	label_main_while_statement
	
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

