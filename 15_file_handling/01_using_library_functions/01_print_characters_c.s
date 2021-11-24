.section .rodata
	
	file_path_to_read:
	.string	"01_print_characters.txt"
	
	read_mode:
	.string	"r"
	
	file_open_error_message:
	.string	"\nCant Open File.\n"
	
	char_format_specifier:
	.string	"%c"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)
	
	movl	$file_path_to_read, (%esp)
	movl	$read_mode, 4(%esp)
	call	fopen
	
	movl	%eax, -4(%ebp)
		
	cmpl	$0, %eax
	je	label_main_file_opening_fail
	
	label_main_while_statement_infinite:
		
		movl	-4(%ebp), %ebx
		xorl	%eax, %eax
		
		movl	%ebx, (%esp)
		call	fgetc
		
		cmpl	$-1, %eax
		je	label_main_exit
		
		movl	$char_format_specifier, (%esp)
		movl	%eax, 4(%esp)
		call	printf
		
		jmp	label_main_while_statement_infinite
					
	label_main_exit:
		
		movl	-4(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
		
		movl	$0, -4(%ebp)
		
		movl	$0, (%esp)
		call	exit
		
	label_main_file_opening_fail:
		
		movl	$file_open_error_message, (%esp)
		call	printf
		
		movl	$-1, (%esp)
		call	exit

