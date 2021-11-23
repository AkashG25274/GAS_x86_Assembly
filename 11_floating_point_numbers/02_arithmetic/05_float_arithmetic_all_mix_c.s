.section .rodata
	
	msg_main_print_ans:
	.string	"fAns = %f\n"
	
	float_value1:
	.float	43.65
	
	int_value1:
	.int	22
	
	float_value2:
	.float	76.34
	
	float_value3:
	.float	3.1
	
	float_value4:
	.float	12.43
	
	int_value2:
	.int	6
	
	float_value5:
	.float	140.2
	
	float_value6:
	.float	94.21
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	finit
	
	flds	float_value1
	fidivs	int_value1
	
	flds	float_value2
	fmuls	float_value3
	
	faddp
	
	flds	float_value4
	fimuls	int_value2
	
	flds	float_value5
	fdivs	float_value6
	
	fsubrp
	
	fdivrp
	
	movl	$msg_main_print_ans, (%esp)
	fstpl	4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit

