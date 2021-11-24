.section .rodata
	
	source_file_path_to_read:
	.string	"03_source_file.txt"
	
	read_mode:
	.string	"r"
	
	source_file_opening_error_msg:
	.string	"\nCant Open Source File\n"
	
	dest_file_path_to_write:
	.string	"03_dest_file.txt"
	
	write_mode:
	.string	"w"
	
	dest_file_opening_error_msg:
	.string	"\nCant Open destination File\n"
	
	msg_main_print_copied_successfully:
	.string	"\nCopied Successfully\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)
	movl	$0, -8(%ebp)
	
	movl	$source_file_path_to_read, (%esp)
	movl	$read_mode, 4(%esp)
	call	fopen
	
	movl	%eax, -4(%ebp)
	
	cmpl	$0, %eax
	je	label_main_source_file_open_fail
	
	movl	$dest_file_path_to_write, (%esp)
	movl	$write_mode, 4(%esp)
	call	fopen
	
	movl	%eax, -8(%ebp)
	
	cmpl	$0, %eax
	je	label_main_dest_file_open_fail
	
	label_main_while_statement_infinite:
		
		movl	-4(%ebp), %ebx
		xorl	%eax, %eax
		
		movl	%ebx, (%esp)
		call	fgetc
		
		cmpl	$-1, %eax
		je	label_main_exit
		
		movl	-8(%ebp), %ebx
		
		movl	%eax, (%esp)
		movl	%ebx, 4(%esp)
		call	fputc
			
	jmp	label_main_while_statement_infinite
	
	label_main_exit:
		
		movl	-4(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
		movl	$0, -4(%ebp)
		
		movl	-8(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
		movl	$0, -8(%ebp)
		
		movl	$msg_main_print_copied_successfully, (%esp)
		call	printf
		
		movl	$0, (%esp)
		call	exit
		
	label_main_dest_file_open_fail:
		
		movl	$dest_file_opening_error_msg, (%esp)
		call	printf
		
		movl	-4(%ebp), %ebx
		movl	%ebx, (%esp)
		call	fclose
		
		movl	$0, -4(%ebp)
		
		movl	$-1, (%esp)
		call	exit
		
	label_main_source_file_open_fail:
	
		movl	$source_file_opening_error_msg, (%esp)
		call	printf
		
		movl	$-1, (%esp)
		call	exit

