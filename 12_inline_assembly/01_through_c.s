	.file	"through_c.c"
	.comm	g_iNo1,4,4
	.comm	g_iNo2,4,4
	.comm	g_iAns,4,4
	.section	.rodata
.LC0:
	.string	"Enter two numbers:\t"
.LC1:
	.string	"%d%d"
.LC2:
	.string	"Answer is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	subl	$12, %esp
	pushl	$.LC0
	call	printf
	addl	$16, %esp
	subl	$4, %esp
	pushl	$g_iNo2
	pushl	$g_iNo1
	pushl	$.LC1
	call	__isoc99_scanf
	addl	$16, %esp
#APP
# 11 "through_c.c" 1
	pusha
	movl	g_iNo1, %eax
	movl	g_iNo2, %edx
	addl	%eax, %edx
	movl	%edx, g_iAns
	popa
	
# 0 "" 2
#NO_APP
	movl	g_iAns, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	subl	$12, %esp
	pushl	$0
	call	exit
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.12) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
