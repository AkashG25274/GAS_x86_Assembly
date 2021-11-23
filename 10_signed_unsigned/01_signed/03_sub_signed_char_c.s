.section .rodata
	
	msg_main_print_set:
	.string	"Overflow bit set.\n"
	
	msg_main_print_not_set:
	.string	"Overflow bit not set.\n"
	
.section .text

.globl 	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp			#align esp
	
	subl	$16, %esp
	
	movb	$130, %al
	movb	$3, %dl
	subb	%dl, %al
	jo	label_main_carry_set
	
	movl	$msg_main_print_not_set, (%esp)
	call	printf
	
	jmp	label_main_exit
		
	label_main_carry_set:
		
		movl	$msg_main_print_set, (%esp)
		call	printf
	
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

