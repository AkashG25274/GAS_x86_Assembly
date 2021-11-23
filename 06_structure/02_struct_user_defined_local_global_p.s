.section .rodata
	
	msg_main_print_enter_obj1:
	.string	"Enter obj1 values:\n"
	
	msg_main_print_enter_char:
	.string	"Enter chChar:\t"
	
	msg_main_scan_obj1_char:
	.string	"%c"
	
	msg_main_scan_obj2_char:
	.string	"%c%c"
	
	msg_main_print_enter_int:
	.string	"Enter iNo:\t"
	
	msg_main_scan_int:
	.string	"%d"
	
	msg_main_print_enter_short_int:
	.string	"Enter shiNo:\t"
	
	msg_main_scan_short_int:
	.string	"%hd"
	
	msg_main_print_enter_obj2:
	.string	"Enter obj2 values:\n"
	
	msg_main_print_obj1:
	.string	"obj1 is\n"
	
	msg_main_print_obj1_contents:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n\n"
	
	msg_main_print_obj2:
	.string	"obj2 is\n"
	
	msg_main_print_obj2_contents:
	.string	"chChar = %c, iNo = %d, shiNo = %hd\n"

.section .bss
	.comm	obj1, 12, 4

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$13, %esp
	
	pushl	$msg_main_print_enter_obj1
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print_enter_char
	call	printf
	addl	$4, %esp
	
	movl	$obj1, %ebx
	pushl	%ebx
	pushl	$msg_main_scan_obj1_char
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_enter_int
	call	printf
	addl	$4, %esp
	
	movl	$obj1, %ebx
	leal	4(%ebx), %eax
	pushl	%eax
	pushl	$msg_main_scan_int
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_enter_short_int
	call	printf
	addl	$4, %esp
	
	movl	$obj1, %ebx
	leal	8(%ebx), %eax
	pushl	%eax
	pushl	$msg_main_scan_short_int
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_enter_obj2
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print_enter_char
	call	printf
	addl	$4, %esp
	
	leal	-13(%ebp), %eax		#t address
	leal	-12(%ebp), %edx		#obj2 char address
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_scan_obj2_char
	call	scanf
	addl	$12, %esp
	
	pushl	$msg_main_print_enter_int
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %eax
	leal	4(%eax), %edx
	pushl	%edx
	pushl	$msg_main_scan_int
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_enter_short_int
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %eax
	leal	8(%eax), %edx
	pushl	%edx
	pushl	$msg_main_scan_short_int
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_obj1
	call	printf
	addl	$4, %esp
	
	movl	$obj1, %ebx
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj1_contents
	call	printf
	addl	$16, %esp
	
	pushl	$msg_main_print_obj2
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx
	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj2_contents
	call	printf
	addl	$16, %esp
	
	pushl	$0
	call	exit

