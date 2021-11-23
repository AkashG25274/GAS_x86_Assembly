.section .rodata
	
	msg_main_print_argc:
	.string	"argc is %d\n\n"
	
	msg_main_print_values:
	.string	"Values are:"
	
	msg_main_print_newline:
	.string	"\n"
	
	msg_main_print_sum:
	.string	"\nSum is %d\n"
	
	msg_main_print_envp:
	.string	"\nEnvp values are:\n"
	
.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp
	
	subl	$16, %esp
	
	movl	$0, -8(%ebp)				
	
	movl	4(%ebp), %eax					#argc
	movl	$msg_main_print_argc, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$msg_main_print_values, (%esp)
	call	puts
	
	movl	$0, -4(%ebp)
	
	jmp	label_main_for_condn_print_argv
	
	label_main_for_statmt_print_argv:
		
		leal	8(%ebp), %ebx				#argv base address		
		movl	(%ebx, %eax, 4), %ebx
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1, -4(%ebp)
		
	label_main_for_condn_print_argv:
		
		movl	-4(%ebp), %eax
		movl	4(%ebp), %edx
		
		cmpl	%edx, %eax
		jl	label_main_for_statmt_print_argv
	
	movl	$1, -4(%ebp)
	
	jmp	label_main_for_condn_sum
	
	label_main_for_statmt_sum:
		
		leal	8(%ebp), %ebx				#argv base address
		movl	(%ebx, %eax, 4), %ebx
		movl	%ebx, (%esp)
		call	atoi
		
		addl	%eax, -8(%ebp)
		addl	$1, -4(%ebp)
		
	label_main_for_condn_sum:
		
		movl	-4(%ebp), %eax
		movl	4(%ebp), %edx
		
		cmpl	%edx, %eax
		jl	label_main_for_statmt_sum
		
	movl	-8(%ebp), %eax
	movl	$msg_main_print_sum, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	movl	$msg_main_print_envp, (%esp)
	call	puts
	
	movl	$0, -4(%ebp)
	
	jmp	label_main_for_condn_print_envp
	
	label_main_for_statmt_print_envp:
		
		movl	(%ebx, %eax, 4), %ebx
		movl	%ebx, (%esp)
		call	puts
		
		addl	$1, -4(%ebp)
		
	label_main_for_condn_print_envp:
		
		leal	12(%ebp), %ebx				#address of argv 1st element
		
		movl	4(%ebp), %eax				#argc
		movl	$4, %ecx
		mull	%ecx
		addl	%eax, %ebx				#base address of envp
		
		movl	-4(%ebp), %eax
		movl	(%ebx, %eax, 4), %edx
		
		cmpl	$0, %edx
		jl	label_main_for_statmt_print_envp
	
	movl	$0, (%esp)
	call	exit

