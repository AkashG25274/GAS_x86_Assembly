.section .rodata
	
	msg_main_print_addition:
	.string	"Addition is %qd\n"
	
.section .data
	
	.globl	no1
	.type	no1, @object
	.size	no1, 8
	.align	4
	no1:
	.quad	4294967296
	
	.globl	no2
	.type	no2, @object
	.size	no2, 8
	.align	4
	no2:
	.quad	2147483648

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	no1, %eax		#LSB of no1
	movl	no1+4, %edx		#MSB of no1
	
	movl	no2, %ecx		#LSB of no2
	movl	no2+4, %ebx		#MSB of no2
	
	addl	%ecx, %eax		#addition of LSB of no1 and no2
	adcl	%ebx, %edx		#addition of MSB of no1 and no2
	
	movl	$msg_main_print_addition, (%esp)
	movl	%eax, 4(%esp)		#LSB of result
	movl	%edx, 8(%esp)		#MSB of result
	call	printf
	
	movl	$0, (%esp)
	call	exit
	
