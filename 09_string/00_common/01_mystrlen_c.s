.section .text

.globl	mystrlen
.type	mystrlen, @function

mystrlen:
	pushl	%ebp
	movl	%esp, %ebp
	
	movl	8(%ebp), %esi			#base address of string
	movl	$0, %edx			#counter initialization
	movl	$255, %ecx			#total iterations of loop instruction
	
	label_mystrlen_loop_instruction:
		
		lodsb
		
		cmpb	$0, %al
		je	label_mystrlen_return
		
		addl	$1, %edx
		
	loop	label_mystrlen_loop_instruction
	
	label_mystrlen_return:
	
		movl	%edx, %eax		#return value
		
		movl	%ebp, %esp
		popl	%ebp
		ret

