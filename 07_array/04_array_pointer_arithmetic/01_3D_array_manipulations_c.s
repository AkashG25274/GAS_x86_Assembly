.section .rodata
	
	msg_main_print1:
	.string	"&arr = %d\n"
	
	msg_main_print2:
	.string	"arr = %d\n"
	
	msg_main_print3:
	.string	"arr[0] = %d\n"
	
	msg_main_print4:
	.string	"arr[0][0] = %d\n"
	
	msg_main_print5:
	.string	"arr[0][0][0] = %d\n"
	
	msg_main_print6:
	.string	"arr[1] = %d\n"
	
	msg_main_print7:
	.string	"arr[1][0] = %d\n"
	
	msg_main_print8:
	.string	"arr[1][0][0] = %d\n"
	
	msg_main_print9:
	.string	"arr[2] = %d\n"
	
	msg_main_print10:
	.string	"arr[2][0] = %d\n"
	
	msg_main_print11:
	.string	"arr[2][0][0] = %d\n"
	
	msg_main_print12:
	.string	"&arr + 1 = %d\n"
	
	msg_main_print13:
	.string	"arr + 1 = %d\n"
	
	msg_main_print14:
	.string	"arr[0] + 1 = %d\n"
	
	msg_main_print15:
	.string	"arr[0][0] + 1 = %d\n"
	
	msg_main_print16:
	.string	"arr[0][0][0] + 1 = %d\n"
	
	msg_main_print17:
	.string	"*arr = %d\n"
	
	msg_main_print18:
	.string	"**arr = %d\n"
	
	msg_main_print19:
	.string	"***arr = %d\n"
	
	msg_main_print20:
	.string	"*(*(*(arr+0)+1)+2) = %d\n"
	
	msg_main_print21:
	.string	"*(*(*(arr+1)+0)+1) = %d\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp		#align %esp
	
	subl	$112, %esp
	
	####### arr initialization #############
	
	movl	$10, -96(%ebp)
	movl	$20, -92(%ebp)
	movl	$30, -88(%ebp)
	movl	$40, -84(%ebp)
	movl	$50, -80(%ebp)
	movl	$60, -76(%ebp)
	movl	$70, -72(%ebp)
	movl	$80, -68(%ebp)
	movl	$90, -64(%ebp)
	movl	$0, -60(%ebp)
	movl	$0, -56(%ebp)
	movl	$0, -52(%ebp)
	movl	$0, -48(%ebp)
	movl	$0, -44(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -36(%ebp)
	movl	$0, -32(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -24(%ebp)
	movl	$0, -20(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	
	########### &arr ##################
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print1, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############# arr #################
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print2, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############# arr[0] ###############
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print3, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	########### arr[0][0] ##############
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print4, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	########## arr[0][0][0] ############
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 1D
	
	addl	%eax, %ebx
	
	movl	$0, %eax		#index 0
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	movl	$msg_main_print5, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############## arr[1] #######################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$msg_main_print6, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############## arr[1][0] #####################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof1D
	
	addl	%eax, %ebx
	
	movl	$msg_main_print7, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############## arr[1][0][0] ###################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof1D
	
	addl	%eax, %ebx
	
	movl	$0, %eax		#index 0
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	movl	$msg_main_print8, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############## arr[2] #######################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$2, %ecx
	mull	%ecx			#2 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$msg_main_print9, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	################ arr[2][0] ####################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$2, %ecx
	mull	%ecx			#2 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof1D
	
	addl	%eax, %ebx
	
	movl	$msg_main_print10, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############### arr[2][0][0] ###################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx			
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$2, %ecx
	mull	%ecx			#2 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof1D
	
	addl	%eax, %ebx
	
	movl	$0, %eax		#index 0
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	movl	$msg_main_print11, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	################ &arr + 1 ######################
	
	movl	$3, %eax
	movl	$2, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#size of 3D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 3D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$msg_main_print12, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	################## arr + 1 #####################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$msg_main_print13, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	################ arr[0] + 1 #####################
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 1D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$msg_main_print14, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############### arr[0][0] + 1 ##################
	
	leal	-96(%ebp), %ebx
	addl	$4, %ebx
	
	movl	$msg_main_print15, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############### arr[0][0][0] + 1 ################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 1D
	
	addl	%eax, %ebx
	
	movl	$0, %eax		#index 0
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	addl	$1, %ebx
	
	movl	$msg_main_print16, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############## *arr #############################
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print17, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############# **arr ############################
	
	leal	-96(%ebp), %ebx
	movl	$msg_main_print18, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	################ ***arr ########################
	
	leal	-96(%ebp), %ebx
	movl	(%ebx), %ebx
	
	movl	$msg_main_print19, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############### *(*(*(arr + 0) + 1) + 2) #############
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 1D
	
	addl	%eax, %ebx
	
	movl	$2, %eax		#index 2
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	movl	$msg_main_print20, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	############ *(*(*(arr + 1) + 0) + 1) #################
	
	movl	$2, %eax
	movl	$4, %ecx
	mull	%ecx
	
	movl	$4, %ecx
	mull	%ecx			#sizeof 2D
	
	movl	$1, %ecx
	mull	%ecx			#1 * sizeof 2D
	
	leal	-96(%ebp), %ebx
	addl	%eax, %ebx
	
	movl	$4, %eax
	movl	$4, %ecx
	mull	%ecx			#sizeof 1D
	
	movl	$0, %ecx
	mull	%ecx			#0 * sizeof 1D
	
	addl	%eax, %ebx
	
	movl	$1, %eax		#index 1
	
	movl	(%ebx, %eax, 4), %ebx	#element
	
	movl	$msg_main_print21, (%esp)
	movl	%ebx, 4(%esp)
	call	printf
	
	movl	$0, (%esp)
	call	exit

