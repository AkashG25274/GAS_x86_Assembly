.section .rodata
	
	msg_main_print1:
	.string	"arr = %-10d \t *arr = %-10d \t &arr = %-10d\n"
	
	msg_main_print2:
	.string	"p = %-10d \t *p = %-10d \t **p = %-10d\n"
	
	msg_main_print3:
	.string	"ptr = %-10d \t *ptr = %-10d \t **ptr = %-10d\n"
	
	msg_main_print4:
	.string	"ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$64, %esp
	
	#### arr initialization ##########
	
	movl	$10, -20(%ebp)
	movl	$20, -16(%ebp)
	movl	$30, -12(%ebp)
	movl	$40, -8(%ebp)
	movl	$50, -4(%ebp)
	
	#### p initialization ############
	
	leal	-20(%ebp), %ebx
	
	movl	%ebx, -40(%ebp)			#arr
	
	movl	$1, %eax
	movl	$4, %ecx
	mull	%ecx				#1 * sizeof element
	
	addl	%eax, %ebx
	
	movl	%ebx, -36(%ebp)			#arr + 1
	
	leal	-20(%ebp), %ebx
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx				#2 * sizeof element
	
	addl	%eax, %ebx
	
	movl	%ebx, -32(%ebp)			#arr + 2
	
	leal	-20(%ebp), %ebx
	
	movl	$3, %eax
	movl	$4, %ecx
	mull	%ecx				#3 * sizeof element
	
	addl	%eax, %ebx
	
	movl	%ebx, -28(%ebp)			#arr + 3
	
	leal	-20(%ebp), %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx				#4 * sizeof element
	
	addl	%eax, %ebx
	
	movl	%ebx, -24(%ebp)			#arr + 4
	
	leal	-20(%ebp), %ebx
	
	movl	$5, %eax
	movl	$4, %ecx
	mull	%ecx				#2 * sizeof element
	
	addl	%eax, %ebx
	
	movl	%ebx, -24(%ebp)			#arr + 5
	
	leal	-40(%ebp), %ebx
	movl	%ebx, -44(%ebp)			#**ptr = p
	
	leal	-20(%ebp), %eax			#arr
	movl	(%eax), %edx			#*arr
	movl	$msg_main_print1, (%esp)
	movl	%eax, 4(%esp)			
	movl	%edx, 8(%esp)
	movl	%eax, 12(%esp)			#&arr
	call	printf
	
	leal	-40(%ebp), %eax			#p
	movl	(%eax), %edx			#*p
	movl	(%edx), %ecx			#**p
	movl	$msg_main_print2, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	call	printf
	
	movl	-44(%ebp), %eax			#ptr
	movl	(%eax), %edx			#*ptr
	movl	(%edx), %ecx			#**ptr
	movl	$msg_main_print3, (%esp)
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	call	printf
	
	################## *ptr++ #####################################
	movl	$1, %eax
	movl	$4, %ecx			#sizeof int*
	mull	%ecx
	
	movl	-44(%ebp), %ebx			#ptr
	addl	%eax, %ebx			#ptr + 1 * sizeof int*
	movl	%ebx, -44(%ebp)
	
	################## ptr - p, *ptr -arr, **ptr ##################
	
	leal	-40(%ebp), %eax			#p
	
	subl	%eax, %ebx			#ptr - p
	
	xorl	%edx, %edx
	movl	%ebx, %eax
	movl	$4, %ecx			#sizeof int*
	divl	%ecx
	
	movl	%eax, %ebx			#ptr - p result
	
	movl	-44(%ebp), %eax			#ptr
	leal	-20(%ebp), %edx			#arr
	
	movl	(%eax), %eax			#*ptr
	
	subl	%edx, %eax
	
	xorl	%edx, %edx
	movl	$4, %ecx			#sizeof element
	divl	%ecx
	
	movl	%eax, %ecx			#*ptr - arr result
	
	movl	-44(%ebp), %eax			#ptr
	movl	(%eax), %eax			#*ptr
	movl	(%eax), %eax			#**ptr
	
	movl	$msg_main_print4, (%esp)
	movl	%ebx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	call	printf
	
	###################### *++ptr #################################
	
	movl	$1, %eax
	movl	$4, %ecx			#sizeof int*
	mull	%ecx
	
	movl	-44(%ebp), %ebx			#ptr
	addl	%eax, %ebx			#ptr + 1 * sizeof int*
	movl	%ebx, -44(%ebp)
	
	##################### ptr -p, *ptr - arr, **ptr ###############
	
	leal	-40(%ebp), %eax			#p
	
	subl	%eax, %ebx			#ptr - p
	
	xorl	%edx, %edx
	movl	%ebx, %eax
	movl	$4, %ecx			#sizeof int*
	divl	%ecx
	
	movl	%eax, %ebx			#ptr - p result
	
	movl	-44(%ebp), %eax			#ptr
	leal	-20(%ebp), %edx			#arr
	
	movl	(%eax), %eax			#*ptr
	
	subl	%edx, %eax
	
	xorl	%edx, %edx
	movl	$4, %ecx			#sizeof element
	divl	%ecx
	
	movl	%eax, %ecx			#*ptr - arr result
	
	movl	-44(%ebp), %eax			#ptr
	movl	(%eax), %eax			#*ptr
	movl	(%eax), %eax			#**ptr
	
	movl	$msg_main_print4, (%esp)
	movl	%ebx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	call	printf
		
	################## ++*ptr #########################################
	
	movl	$1, %eax
	movl	$4, %ecx			#sizeof element
	mull	%ecx
		
	movl	-44(%ebp), %ebx			#ptr
	movl	(%ebx), %ecx			#*ptr
	
	addl	%eax, %ecx			#*ptr + 1 * sizeof element
	movl	%ecx, (%ebx)			#move to *ptr
	
	#################### ptr - p, *ptr -arr, **ptr #####################
	
	leal	-40(%ebp), %eax			#p
	
	subl	%eax, %ebx			#ptr - p
	
	xorl	%edx, %edx
	movl	%ebx, %eax
	movl	$4, %ecx			#sizeof int*
	divl	%ecx
	
	movl	%eax, %ebx			#ptr - p result
	
	movl	-44(%ebp), %eax			#ptr
	leal	-20(%ebp), %edx			#arr
	
	movl	(%eax), %eax			#*ptr
	
	subl	%edx, %eax
	
	xorl	%edx, %edx
	movl	$4, %ecx			#sizeof element
	divl	%ecx
	
	movl	%eax, %ecx			#*ptr - arr result
	
	movl	-44(%ebp), %eax			#ptr
	movl	(%eax), %eax			#*ptr
	movl	(%eax), %eax			#**ptr
	
	movl	$msg_main_print4, (%esp)
	movl	%ebx, 4(%esp)
	movl	%ecx, 8(%esp)
	movl	%eax, 12(%esp)
	call	printf
		
	movl	$0, (%esp)
	call	exit

