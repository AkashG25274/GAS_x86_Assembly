.section .rodata
	
	file_path_to_read:
	.string	"05_keyboard_to_text_file.txt"
	
	read_mode:
	.string	"r"
	
	file_open_fail_msg:
	.string	"\nCant Open File\n"
	
	msg_main_print:
	.string	"%s"

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
		
		leal	-54(%ebp), %ebx
		movl	$msg_main_print, (%esp)
		movl	%ebx, 4(%esp)
		call	printf
	
	label_main_while_condition:
		
		movl	-4(%ebp), %eax
		leal	-54(%ebp), %edx
		
		movl	%edx, (%esp)
		movl	$49, 4(%esp)
		movl	%eax, 8(%esp)
		call	fgets
		
		cmpl	$0, %eax
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

