.section .rodata

	msg_main_print_enter_obj2:
	.string	"Enter obj2 value,\n"
	
	msg_main_print_enter_char:
	.string	"Enter chChar\t:"
	
	msg_main_scan_char:
	.string	"%c"
	
	msg_main_print_enter_int:
	.string	"Enter iNo\t:"
	
	msg_main_scan_int:
	.string	"%d"
	
	msg_main_print_enter_short_int:
	.string	"Enter shiNo\t:"
	
	msg_main_scan_short_int:
	.string	"%hd"
	
	msg_main_print_obj2:
	.string	"obj2 is\n"
	
	msg_main_print_obj_contents:
	.string	"chChar is %c, iNo is %d, shiNo is %hd\n"
	
	msg_main_print_obj1:
	.string	"\nobj1 is\n"
	
	msg_main_print_obj3:
	.string	"obj3 is\n"
	
.section .bss
	
	.comm	obj1, 12, 4
	
.section .text
	
.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$24, %esp
	
	pushl	$msg_main_print_enter_obj2
	call	printf
	addl	$4, %esp
	
	pushl	$msg_main_print_enter_char
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %ebx
	pushl	%ebx
	pushl	$msg_main_scan_char
	call	scanf
	addl	$8, %esp
	
	pushl	$msg_main_print_enter_int
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %eax
	leal	4(%eax), %edx
	pushl	%edx
	pushl	$msg_main_scan_int
	call	scanf
	addl	$4, %esp
	
	pushl	$msg_main_print_enter_short_int
	call	printf
	addl	$4, %esp
	
	leal	-12(%ebp), %eax
	leal	8(%eax), %edx
	pushl	%edx
	pushl	$msg_main_scan_short_int
	call	scanf
	addl	$8, %esp
	
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
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	leal	-12(%ebp), %ebx		#obj2 address
	
	#copy obj2 contents to resister
	
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	movw	8(%ebx), %cx
	
	movl	$obj1, %ebx		#obj1 address

	#assign obj2 contents to obj1
	
	movb	%al, (%ebx)
	movl	%edx, 4(%ebx)
	movw	%cx, 8(%ebx)
	
	leal	-24(%ebp), %ebx		#obj3 address
	
	#assign obj2 contents to obj3

	movb	%al, (%ebx)
	movl	%edx, 4(%ebx)
	movw	%cx, 8(%ebx)
	
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
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	pushl	$msg_main_print_obj3
	call	printf
	addl	$4, %esp
	
	leal	-24(%ebp), %ebx

	xorl	%eax, %eax
	movb	(%ebx), %al
	movl	4(%ebx), %edx
	xorl	%ecx, %ecx
	movw	8(%ebx), %cx
	
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$msg_main_print_obj_contents
	call	printf
	addl	$16, %esp
	
	pushl	$0
	call	exit

