.section .rodata
	
	msg_main_print_set:
	.string	"Carry bit set.\n"
	
	msg_main_print_not_set:
	.string	"Carry bit not set.\n"
	
	msg_main_print_addition:
	.string	"Addition is %d\n"
	
.section .text

.globl 	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp			#align esp
	
	subl	$16, %esp
	
	xorl	%eax, %eax
	xorl	%edx, %edx
		
	movb	$250, %al
	movb	$5, %dl
	addb	%dl, %al
	
	movl	$msg_main_print_addition, (%esp)
	movl	%eax, 4(%esp)
	call	printf
		
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

