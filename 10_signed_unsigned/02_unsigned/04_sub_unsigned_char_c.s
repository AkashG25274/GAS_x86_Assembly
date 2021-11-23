.section .rodata
	
	msg_main_print_set:
	.string	"Carry bit set.\n"
	
	msg_main_print_not_set:
	.string	"Carry bit not set.\n"
	
.section .text

.globl 	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp			#align esp
	
	subl	$16, %esp
	
	movb	$5, %al
	movb	$6, %dl
	subb	%dl, %al
	jc	label_main_carry_set
	
	movl	$msg_main_print_not_set, (%esp)
	call	printf
	
	jmp	label_main_exit
		
	label_main_carry_set:
		
		movl	$msg_main_print_set, (%esp)
		call	printf
	
	label_main_exit:
		
		movl	$0, (%esp)
		call	exit

