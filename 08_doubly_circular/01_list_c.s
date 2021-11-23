.section .rodata

	msg_main_print_choices:
	.string	"\n1.Insert\n2.Delete\n3.Search\n4.Count\n5.Reverse Display\n6.Exit\n"
	
	msg_main_print_enter_choice:
	.string	"Enter your choice:\t"
	
	msg_main_scan:
	.string	"%d"
	
	msg_main_print_insert_choices:
	.string	"\n1.InsertFirst\n2.InsertLast\n3.InsertAtPosition\n4.Back\n"
	
	msg_main_print_enter_choice_again:
	.string	"Enter your choice again:\t"
	
	msg_main_print_enter_valid_choice:
	.string	"Enter valid choice\n"
	
	msg_main_print_enter_data_to_insert:
	.string	"Enter data to be insert:\t"
	
	msg_main_print_enter_position:
	.string	"Enter position:\t"
	
	msg_main_print_delete_impossible:
	.string	"Linked List Empty, Deletion impossible.\n"
	
	msg_main_print_delete_choices:
	.string	"\n1.DeleteFirst\n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"
	
	msg_main_print_list_empty:
	.string	"Linked List Empty\n"
	
	msg_main_print_deleted_data:
	.string	"Deleted data is %d\n"
	
	msg_main_print_searching_impossible:
	.string	"Linked List Empty, Searching impossible.\n"
	
	msg_main_print_search_choices:
	.string	"\n1.SearchFirstOccurance\n2.SearchLastOccurance\n3.SearchAllOccurances\n4.Back\n"
	
	msg_main_print_enter_data_to_search:
	.string	"Enter data to be search:\t"
	
	msg_main_print_data_not_found:
	.string	"Data not found\n"
	
	msg_main_print_data_found:
	.string	"Data found at %d position\n"
	
	msg_main_print_data_found_times:
	.string	"Data found %d times\n"
	
	msg_main_print_total_node_present:
	.string	"Total node present : %d\n"
	
	msg_main_print_bye:
	.string	"Bye...\n"
	
	msg_insert_first_print_allocation_fail:
	.string	"memory allocation FAILED\n"
	
	msg_insert_at_position_print_position_invalid:
	.string	"Position is invalid\n"
	
	msg_display_print_linked_list_is:
	.string	"\nLinked list is:\n"
	
	msg_display_print_empty:
	.string	"EMPTY\n"
	
	msg_display_print_data:
	.string	"<-|%d|->"
	
	msg_display_print_carriage_return:
	.string	"\n"
	
	msg_delete_all_nodes_print_deleted_all_nodes:
	.string	"\nDeleted All Nodes Successfully\n"
	
	msg_reverse_display_print_reverse_linked_list_is:
	.string	"\nReverse Linked list is:\n"

.section .text

.globl	main
.type	main, @function

main:
	pushl	%ebp
	movl	%esp, %ebp
	
	andl	$-16, %esp					#align %esp
	
	subl	$48, %esp
	
	movl	$0, -16(%ebp)					#*pFirst = NULL
	movl	$0, -20(%ebp)					#*pLast = NULL
	
label_main_while_statement_infinite:
	
	movl	$msg_main_print_choices, (%esp)
	call	printf
	
	movl	$msg_main_print_enter_choice, (%esp)
	call	printf
	
	leal	-12(%ebp), %ebx					#iChoice address
	movl	$msg_main_scan, (%esp)
	movl	%ebx, 4(%esp)
	call	scanf
	
	movl	-16(%ebp), %eax					#pFirst
	movl	-20(%ebp), %edx					#pLast
	
	movl	-12(%ebp), %ecx					#iChoice
	
	cmpl	$1, %ecx
	je	label_main_insert
	
	cmpl	$2, %ecx
	je	label_main_delete
	
	cmpl	$3, %ecx
	je	label_main_search
	
	cmpl	$4, %ecx
	je	label_main_count
	
	cmpl	$5, %ecx
	je	label_main_reverse
	
	cmpl	$6, %ecx
	je	label_main_exit
	
	jmp	label_main_default
	
label_main_insert:
	
	label_main_while_statement_insert_infinite:
		
		movl	$msg_main_print_insert_choices, (%esp)
		call	printf
		
		movl	$msg_main_print_enter_choice_again, (%esp)
		call	printf
		
		leal	-12(%ebp), %ebx					#iChoice address
		movl	$msg_main_scan, (%esp)
		movl	%ebx, 4(%esp)
		call	scanf
		
		movl	-12(%ebp), %eax					#iChoice
		
		cmpl	$4, %eax
		je	label_main_while_statement_infinite
		
		cmpl	$0, %eax
		jle	label_main_insert_print_valid_choice
		
		cmpl	$3, %eax
		jg	label_main_insert_print_valid_choice
		
		movl	$msg_main_print_enter_data_to_insert, (%esp)
		call	printf
		
		leal	-4(%ebp), %ebx					#iNo address
		movl	$msg_main_scan, (%esp)
		movl	%ebx, 4(%esp)
		call	scanf
		
		movl	-12(%ebp), %eax					#iChoice
		
		leal	-16(%ebp), %edx					#pFirst address
		leal	-20(%ebp), %ecx					#pLast address
		movl	-4(%ebp), %ebx					#iNo
		
		cmpl	$1, %eax
		je	label_main_insert_first
		
		cmpl	$2, %eax
		je	label_main_insert_last
		
		cmpl	$3, %eax
		je	label_main_insert_at_position
				
		label_main_insert_print_valid_choice:
		
			movl	$msg_main_print_enter_valid_choice, (%esp)
			call	printf
		
			jmp	label_main_while_statement_insert_infinite
		
		label_main_insert_first:
	
			movl	%edx, (%esp)						#pFirst address
			movl	%ecx, 4(%esp)						#pLast address
			movl	%ebx, 8(%esp)						#iNo
			call	InsertFirst

			jmp	label_main_insert_display_linked_list

		label_main_insert_last:
		
			movl	%edx, (%esp)					#pFirst address
			movl	%ecx, 4(%esp)					#pLast address
			movl	%ebx, 8(%esp)					#iNo
			call	InsertLast

			jmp	label_main_insert_display_linked_list

		label_main_insert_at_position:
	
			movl	$msg_main_print_enter_position, (%esp)
			call	printf
		
			leal	-8(%ebp), %ebx					#iPosition address
			movl	$msg_main_scan, (%esp)
			movl	%ebx, 4(%esp)
			call	scanf
		
			leal	-16(%ebp), %eax					#pFirst address
			leal	-20(%ebp), %edx					#pLast address
			movl	-4(%ebp), %ecx					#iNo
			movl	-8(%ebp), %ebx					#iPosition
		
			movl	%eax, (%esp)
			movl	%edx, 4(%esp)
			movl	%ecx, 8(%esp)
			movl	%ebx, 12(%esp)
			call	InsertAtPosition

		label_main_insert_display_linked_list:
	
			movl	-16(%ebp), %eax					#pFirst
			movl	-20(%ebp), %edx					#pLast
			movl	%eax, (%esp)
			movl	%edx, 4(%esp)
			call	Display
		
			jmp	label_main_while_statement_insert_infinite
			
label_main_delete:
	
	cmpl	$0, %eax
	
	jne	label_main_while_statement_delete_infinite
	
	movl	$msg_main_print_delete_impossible, (%esp)
	call	printf
	
	jmp	label_main_while_statement_infinite
	
	label_main_while_statement_delete_infinite:
		
		movl	$msg_main_print_delete_choices, (%esp)
		call	printf
		
		movl	$msg_main_print_enter_choice_again, (%esp)
		call	printf
		
		leal	-12(%ebp), %ebx					#iChoice address
		movl	$msg_main_scan, (%esp)
		movl	%ebx, 4(%esp)
		call	scanf
				
		movl	-12(%ebp), %eax					#iChoice
		
		cmpl	$4, %eax
		je	label_main_while_statement_infinite
		
		leal	-16(%ebp), %edx					#pFirst address
		leal	-20(%ebp), %ecx					#pLast address
		
		cmpl	$1, %eax
		je	label_main_delete_first
		
		cmpl	$2, %eax
		je	label_main_delete_last
		
		cmpl	$3, %eax
		je	label_main_delete_at_position
		
		jmp	label_main_delete_default
			
		label_main_delete_first:
	
			movl	%edx, (%esp)					#pFirst address
			movl	%ecx, 4(%esp)					#pLast adddress
			call	DeleteFirst
	
			movl	%eax, -4(%ebp)					#iNo
	
			jmp	label_main_delete_display_linked_list

		label_main_delete_last:
	
			movl	%edx, (%esp)					#pFirst address
			movl	%ecx, 4(%esp)					#pLast adddress
			call	DeleteLast
	
			movl	%eax, -4(%ebp)					#iNo
	
			jmp	label_main_delete_display_linked_list

		label_main_delete_at_position:
	
			movl	$msg_main_print_enter_position, (%esp)
			call	printf
	
			leal	-8(%ebp), %ebx					#iPosition address
			movl	$msg_main_scan, (%esp)
			movl	%ebx, 4(%esp)
			call	scanf
	
			leal	-16(%ebp), %eax					#pFirst address
			leal	-20(%ebp), %edx					#pLast address
			movl	-8(%ebp), %ecx					#iPosition
	
			movl	%eax, (%esp)
			movl	%edx, 4(%esp)
			movl	%ecx, 8(%esp)
			call	DeleteAtPosition

			movl	%eax, -4(%ebp)					#iNo
	
			jmp	label_main_delete_display_linked_list
		
		label_main_delete_default:
		
			movl	$msg_main_print_enter_valid_choice, (%esp)
			call	printf
		
			movl	$4, -12(%ebp)
	
	label_main_delete_display_linked_list:
			
		movl	-4(%ebp), %eax				#iNo
			
		cmpl	$-1, %eax
			
		jne	label_main_delete_check_iChoice_iNo
			
		movl	$msg_main_print_list_empty, (%esp)
		call	printf
			
		jmp	label_main_while_statement_delete_infinite
			
		label_main_delete_check_iChoice_iNo:
			
			movl	-12(%ebp), %edx			#iChoice
			
			cmpl	$4, %edx
			
			je	label_main_while_statement_delete_infinite
				
			cmpl	$-2, %eax
			je	label_main_while_statement_delete_infinite
				
			movl	$msg_main_print_deleted_data, (%esp)
			movl	%eax, 4(%esp)
			call	printf
			
			movl	-16(%ebp), %eax			#pFirst
			movl	-20(%ebp), %edx			#pLast
			movl	%eax, (%esp)
			movl	%edx, 4(%esp)
			call	Display
			
			jmp	label_main_while_statement_delete_infinite

label_main_search:
		
	cmpl	$0, %eax
	
	jne	label_main_while_statement_search_infinite
	
	movl	$msg_main_print_searching_impossible, (%esp)
	call	printf
	
	jmp	label_main_while_statement_infinite
	
	label_main_while_statement_search_infinite:
		
		movl	$msg_main_print_search_choices, (%esp)
		call	printf
		
		movl	$msg_main_print_enter_choice_again, (%esp)
		call	printf
		
		leal	-12(%ebp), %ebx				#iChoice address
		movl	$msg_main_scan, (%esp)
		movl	%ebx, 4(%esp)
		call	scanf
		
		movl	-12(%ebp), %eax				#iChoice
		
		cmpl	$4, %eax
		je	label_main_while_statement_infinite
		
		cmpl	$0, %eax
		jle	label_main_search_enter_valid_choice
		
		cmpl	$3, %eax
		jg	label_main_search_enter_valid_choice
		
		movl	-16(%ebp), %eax				#pFirst
		movl	-20(%ebp), %edx				#pLast
		movl	%eax, (%esp)
		movl	%edx, 4(%esp)
		call	Display
		
		movl	$msg_main_print_enter_data_to_search, (%esp)
		call	printf
		
		leal	-4(%ebp), %ebx				#iNo address
		movl	$msg_main_scan, (%esp)
		movl	%ebx, 4(%esp)
		call	scanf
		
		movl	-12(%ebp), %eax				#iChoice
		
		movl	-16(%ebp), %edx				#pFirst
		movl	-20(%ebp), %ecx				#pLast
		movl	-4(%ebp), %ebx				#iNo
		
		cmpl	$1, %eax
		je	label_main_search_first_occurance
		
		cmpl	$2, %eax
		je	label_main_search_last_occurance
		
		cmpl	$3, %eax
		je	label_main_search_all_occurances
		
		label_main_search_first_occurance:
	
			movl	%edx, (%esp)					#pFirst
			movl	%ecx, 4(%esp)					#pLast
			movl	%ebx, 8(%esp)					#iNo
			call	SearchFirstOccurance
	
			movl	%eax, -4(%ebp)					#iNo
	
			cmpl	$-1, %eax
			jne	label_main_search_first_check_second_condn
	
			movl	$msg_main_print_list_empty, (%esp)
			call	printf
	
			jmp	label_main_while_statement_search_infinite
	
			label_main_search_first_check_second_condn:
		
				cmpl	$-2, %eax
				jne	label_main_search_first_print_data_found
		
				movl	$msg_main_print_data_not_found, (%esp)
				call	printf
		
				jmp	label_main_while_statement_search_infinite
		
			label_main_search_first_print_data_found:
		
				movl	$msg_main_print_data_found, (%esp)
				movl	%eax, 4(%esp)
				call	printf
		
			jmp	label_main_while_statement_search_infinite

		label_main_search_last_occurance:
	
			movl	%edx, (%esp)					#pFirst
			movl	%ecx, 4(%esp)					#pLast
			movl	%ebx, 8(%esp)					#iNo
			call	SearchLastOccurance
	
			movl	%eax, -4(%ebp)					#iNo
	
			cmpl	$-1, %eax
			jne	label_main_search_last_check_second_condn
	
			movl	$msg_main_print_list_empty, (%esp)
			call	printf
	
			jmp	label_main_while_statement_search_infinite
	
			label_main_search_last_check_second_condn:
		
			cmpl	$-2, %eax
			jne	label_main_search_last_print_data_found
		
			movl	$msg_main_print_data_not_found, (%esp)
			call	printf
		
			jmp	label_main_while_statement_search_infinite
		
			label_main_search_last_print_data_found:
		
			movl	$msg_main_print_data_found, (%esp)
			movl	%eax, 4(%esp)
			call	printf
		
			jmp	label_main_while_statement_search_infinite

		label_main_search_all_occurances:
	
			movl	%edx, (%esp)					#pFirst
			movl	%ecx, 4(%esp)					#pLast
			movl	%ebx, 8(%esp)					#iNo
			call	SearchAllOccurances
	
			movl	%eax, -4(%ebp)					#iNo
	
			movl	$msg_main_print_data_found_times, (%esp)
			movl	%eax, 4(%esp)
			call	printf
	
			jmp	label_main_while_statement_search_infinite

	label_main_search_enter_valid_choice:
			
		movl	$msg_main_print_enter_valid_choice, (%esp)
		call	printf
			
		jmp	label_main_while_statement_search_infinite
			
label_main_count:
	
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	Display
	
	movl	-16(%ebp), %eax					#pFirst
	movl	-20(%ebp), %edx					#pLast
	
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	CountNode
	
	movl	%eax, -4(%ebp)					#iNo
	
	movl	$msg_main_print_total_node_present, (%esp)
	movl	%eax, 4(%esp)
	call	printf
	
	jmp	label_main_while_statement_infinite
	
label_main_reverse:
	
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	Display
	
	movl	-16(%ebp), %eax					#pFirst
	movl	-20(%ebp), %edx					#pLast
	
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	ReverseDisplay
	
	jmp	label_main_while_statement_infinite

label_main_exit:

	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	Display
	
	movl	-16(%ebp), %eax					#pFirst
	cmpl	$0, %eax
	je	label_main_exit_process
		
	leal	-16(%ebp), %eax					#pFirst address
	leal	-20(%ebp), %edx					#pLast address
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	DeleteAllNodes
		
	label_main_exit_process:
			
		movl	$msg_main_print_bye, (%esp)
		call	printf
		
		movl	$0, (%esp)
		call	exit

label_main_default:

	movl	$msg_main_print_enter_valid_choice, (%esp)
	call	printf
	
	jmp	label_main_while_statement_infinite

######################################### InsertFirst ##################################################

.globl	InsertFirst
.type	InsertFirst, @function

InsertFirst:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)					#*pNewNode = NULL
	
	movl	$12, (%esp)
	call	malloc
	
	movl	%eax, -4(%ebp)					#pNewNode
	
	cmpl	$0, %eax
	je	label_insert_first_allocation_fail
	
	movl	16(%ebp), %edx					#iNo
	
	movl	%edx, 4(%eax)
	
	movl	8(%ebp), %edx					#ppHead(pFirst address)
	movl	(%edx), %ecx					#*ppHead
	movl	12(%ebp), %ebx					##ppTail(pLast address)
					
	cmpl	$0, %ecx
	je	label_insert_first_list_empty
	
	movl	%ecx, 8(%eax)					#pNewNode -> pNext = (*ppHead)
	movl	%eax, (%ecx)					#(*ppHead) -> pPrev = pNewNode
	movl	%eax, (%edx)					#*ppHead = pNewNode
	
	movl	(%ebx), %ebx					#*ppTail
	movl	(%edx), %ecx					#*ppHead
	
	movl	%ecx, 8(%ebx)
	movl	%ebx, (%ecx)
	
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_insert_first_list_empty:
		
		movl	%eax, (%edx)				#*ppHead = pNewNode
		movl	%eax, (%ebx)				#*ppTail = pNewNode
		
		#movl	(%edx), %edx				#*ppHead
		movl	(%ebx), %ecx				#*ppTail
		
		movl	%eax, 8(%ecx)				#(*ppTail) -> pNext = *ppHead
		
		movl	%ecx, (%edx)
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_insert_first_allocation_fail:
	
		movl	$msg_insert_first_print_allocation_fail, (%esp)
		call	printf
		
		movl	%ebp, %esp
		popl	%ebp
		ret

########################################### InsertLast ############################################################

.globl	InsertLast
.type	InsertLast, @function

InsertLast:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)					#*pNewNode = NULL
	
	movl	$12, (%esp)
	call	malloc
	
	movl	%eax, -4(%ebp)
	
	cmpl	$0, %eax
	je	label_insert_last_allocation_fail
	
	movl	16(%ebp), %edx					#iNo
	movl	%edx, 4(%eax)
	
	movl	8(%ebp), %edx					#ppHead(pFirst address)
	movl	(%edx), %ecx					#*ppHead
	movl	12(%ebp), %ebx					#ppTail(plast address)
	
	cmpl	$0, %ecx
	je	label_insert_last_list_empty
	
	movl	(%ebx), %ecx					#*ppTail
	movl	%eax, 8(%ecx)
	movl	%ecx, (%eax)
	movl	%eax, (%ebx)
	
	movl	(%ebx), %ecx					#*ppTail
	movl	(%edx), %ebx					#*ppHead
	
	movl	%ebx, 8(%ecx)
	movl	%ecx, (%ebx)
	
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_insert_last_list_empty:
		
		movl	%eax, (%edx)				#*ppHead = pNewNode
		movl	%eax, (%ebx)				#*ppTail = pNewNode
		
		#movl	(%edx), %edx				#*ppHead
		movl	(%ebx), %ecx				#*ppTail
		
		movl	%eax, 8(%ecx)				#(*ppTail) -> pNext = *ppHead
		
		movl	%ecx, (%edx)
		
		movl	%ebp, %esp
		popl	%ebp
		ret
			
	label_insert_last_allocation_fail:
		
		movl	$msg_insert_first_print_allocation_fail, (%esp)
		call	printf
		
		movl	%ebp, %esp
		popl	%ebp
		ret

############################################ InsertAtPosition  ####################################################

.globl	InsertAtPosition
.type	InsertAtPosition, @function

InsertAtPosition:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$32, %esp
	
	movl	$0, -4(%ebp)					#*pNewNode = NULL
	movl	$0, -8(%ebp)					#*pTemp = NULL
	
	movl	8(%ebp), %eax					#ppHead(pFirst address)
	movl	(%eax), %eax					#*ppHead
	
	movl	12(%ebp), %edx					#ppTail(pLast address)
	movl	(%edx), %edx					#*ppTail
	
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	CountNode
	
	movl	%eax, -12(%ebp)					#iCount
	
	movl	20(%ebp), %edx					#iPos
	
	cmpl	$0, %edx
	jle	label_insert_at_position_invalid_position
	
	addl	$1, %eax					#iCount + 1
	
	cmpl	%eax, %edx
	jg	label_insert_at_position_invalid_position
	
	cmpl	$1, %edx
	je	label_insert_at_position_first_position
	
	cmpl	%edx, %eax
	je	label_insert_at_position_last_position
	
	movl	8(%ebp), %eax					#ppHead
	movl	(%eax), %ecx					#*ppHead	
	movl	%ecx, -8(%ebp)
	
	movl	$1, -12(%ebp)
	
	subl	$1, %edx					#iPos - 1
	#movl	-8(%ebp), %ecx					#pTemp
	
	jmp 	label_insert_at_position_while_condn
	
	label_insert_at_position_while_statement:
		
		addl	$1, -12(%ebp)
		movl	8(%ecx), %ecx
		movl	%ecx, -8(%ebp)
		
	label_insert_at_position_while_condn:
		
		movl	-12(%ebp), %eax				#iCount
		
		cmpl	%edx, %eax
		jl	label_insert_at_position_while_statement
	
	movl	$12, (%esp)
	call	malloc
	
	movl	%eax, -4(%ebp)					#pNewNode
	
	cmpl	$0, %eax
	je	label_insert_at_position_allocation_fail
	
	movl	16(%ebp), %edx					#iNo
	
	movl	%edx, 4(%eax)
	
	movl	-8(%ebp), %ecx					#pTemp
	movl	8(%ecx), %edx					#pTemp->pNext
	
	movl	%edx, 8(%eax)
	movl	%eax, (%edx)
	movl	%eax, 8(%ecx)
	movl	%ecx, (%eax)
	
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_insert_at_position_allocation_fail:
		
		movl	$msg_insert_first_print_allocation_fail, (%esp)
		call	printf
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_insert_at_position_first_position:
		
		movl	8(%ebp), %eax				#ppHead
		movl	12(%ebp), %edx				#ppTail
		movl	16(%ebp), %ecx				#iNo
		movl	%eax, (%esp)
		movl	%edx, 4(%esp)
		movl	%ecx, 8(%esp)
		call	InsertFirst
		
		movl	%ebp, %esp
		popl	%ebp
		ret
	
	label_insert_at_position_last_position:
		
		movl	8(%ebp), %eax				#ppHead
		movl	12(%ebp), %edx				#ppTail
		movl	16(%ebp), %ecx				#iNo
		movl	%eax, (%esp)
		movl	%edx, 4(%esp)
		movl	%ecx, 8(%esp)
		call	InsertLast
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_insert_at_position_invalid_position:
		
		movl	$msg_insert_at_position_print_position_invalid, (%esp)
		call	printf
		
		movl	%ebp, %esp
		popl	%ebp
		ret
	
########################################## DeleteFirst ########################################################

.globl	DeleteFirst
.type	DeleteFirst, @function

DeleteFirst:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %eax					#ppHead(pFirst address)
	movl	(%eax), %edx					#*ppHead
	
	cmpl	$0, %edx
	je	label_delete_first_empty_list
	
	movl	4(%edx), %ecx
	movl	%ecx, -4(%ebp)
	
	movl	12(%ebp), %ecx					#ppTail(pLast address)
	movl	(%ecx), %ebx					#*ppTail
	
	cmpl	%ebx, %edx
	je	label_delete_first_single_node
	
	movl	8(%edx), %ecx					#(*ppHead)->pNext
	movl	%ecx, (%eax)
	movl	8(%ebx), %edx					#(*ppTail)->pNext
	movl	$0, 8(%edx)
	movl	$0, (%edx)
	
	movl	%edx, (%esp)
	call	free
	
	movl	8(%ebp), %eax					#ppHead
	movl	(%eax), %edx					#*ppHead
	
	movl	12(%ebp), %ecx					#ppTail
	movl	(%ecx), %ebx					#*ppTail
	
	movl	%edx, 8(%ebx)
	movl	%ebx, (%edx)
	
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_delete_first_single_node:
		
		movl	$0, 8(%edx)
		movl	$0, (%edx)
		
		movl	%edx, (%esp)
		call	free
		
		movl	8(%ebp), %eax					#ppHead
		movl	12(%ebp), %edx					#ppTail	
		movl	$0, (%eax)
		movl	$0, (%edx)
		
		movl	-4(%ebp), %eax
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_delete_first_empty_list:
		
		movl	$-1, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret

####################################### DeleteLast ##################################################

.globl	DeleteLast
.type	DeleteLast, @function

DeleteLast:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %eax					#ppHead(pFirst address)
	movl	(%eax), %edx					#*ppHead
	
	cmpl	$0, %edx
	je	label_delete_last_empty_list
	
	movl	12(%ebp), %ecx					#ppTail(pLast address)
	movl	(%ecx), %ebx					#*ppTail
	
	movl	4(%ebx), %ebx					#(*ppTail)->iData
	movl	%ebx, -4(%ebp)
	
	movl	(%ecx), %ebx					#*ppTail
	
	cmpl	%ebx, %edx
	je	label_delete_last_single_node
	
	movl	(%ebx), %ebx					#(*ppTail)->pPrev
	movl	%ebx, (%ecx)
	movl	(%edx), %ecx					#(*ppHead)->pPrev
	movl	$0, 8(%ecx)
	movl	$0, (%ecx)
	
	movl	%ecx, (%esp)
	call	free
	
	movl	8(%ebp), %eax					#ppHead
	movl	(%eax), %edx					#*ppHead
	
	movl	12(%ebp), %ecx					#ppTail
	movl	(%ecx), %ebx					#*ppTail
	
	movl	%edx, 8(%ebx)
	movl	%ebx, (%edx)
	
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_delete_last_single_node:
		
		movl	$0, 8(%edx)
		movl	$0, (%edx)
		
		movl	%edx, (%esp)
		call	free
		
		movl	8(%ebp), %eax				#ppHead
		movl	12(%ebp), %edx				#ppTail
		
		movl	$0, (%eax)
		movl	$0, (%edx)
		
		movl	-4(%ebp), %eax
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_delete_last_empty_list:
		
		movl	$-1, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret

######################################## DeleteAtPosition ###########################################################

.globl	DeleteAtPosition
.type	DeleteAtPosition, @function

DeleteAtPosition:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)				#pTemp = NULL
	
	movl	8(%ebp), %eax				#ppHead
	movl	(%eax), %edx				#*ppHead
	
	movl	12(%ebp), %ecx				#ppTail
	movl	(%ecx), %ebx				#*ppTail
	
	movl	%edx, (%esp)
	movl	%ebx, 4(%esp)
	call	CountNode
	
	movl	%eax, -8(%ebp)				#iCount
	
	movl	16(%ebp), %edx				#iPos
	
	cmpl	$0, %edx
	jle	label_delete_at_position_invalid_position
	
	cmpl	%eax, %edx
	jg	label_delete_at_position_invalid_position
	
	movl	8(%ebp), %ecx				#ppHead
	movl	12(%ebp), %ebx				#ppTail
	
	cmpl	$1, %edx
	je	label_delete_at_position_delete_first
	
	cmpl	%edx, %eax
	je	label_delete_at_position_delete_last
	
	movl	(%ecx), %ecx				#*ppHead
	
	movl	%ecx, -4(%ebp)				#pTemp
	
	movl	$1, -8(%ebp)				#iCount = 1
	
	jmp	label_delete_at_position_while_condn
	
	label_delete_at_position_while_statement:
		
		addl	$1, -8(%ebp)
		movl	8(%ecx), %ecx
		
	label_delete_at_position_while_condn:
		
		movl	-8(%ebp), %eax			#iCount
		
		cmpl	%edx, %eax
		jl	label_delete_at_position_while_statement
	
	movl	(%ecx), %eax 				#pTemp->pPrev
	movl	8(%ecx), %edx				#pTemp->pNext
	
	movl	%edx, 8(%eax)
	movl	%eax, (%edx)
	
	movl	$0, 8(%ecx)
	movl	$0, (%ecx)
	
	movl	4(%ecx), %eax
	movl	%eax, -8(%ebp)
	
	movl	%ecx, (%esp)
	call	free
	
	movl	-8(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
	
	label_delete_at_position_delete_last:
		
		movl	%ecx, (%esp)
		movl	%ebx, 4(%esp)
		call	DeleteLast
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_delete_at_position_delete_first:
		
		movl	%ecx, (%esp)
		movl	%ebx, 4(%esp)
		call	DeleteFirst
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_delete_at_position_invalid_position:
		
		movl	$msg_insert_at_position_print_position_invalid, (%esp)
		call	printf
		
		movl	$-2, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret

############################################# SearchFirstOccurance  ####################################################

.globl	SearchFirstOccurance
.type	SearchFirstOccurance, @function

SearchFirstOccurance:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %eax				#*pHead
	
	cmpl	$0, %eax
	je	label_search_first_occurance_empty_list
	
	movl	$1, -4(%ebp)				#iPos = 1
	movl	16(%ebp), %edx				#iKey
	movl	12(%ebp), %ecx				#*pTail
	
	label_search_first_occurance_do_statement:
		
		cmpl	%edx, 4(%eax)
		je	label_search_first_occurrance_break_do
		
		addl	$1, -4(%ebp)
		movl	8(%eax), %eax
	
		cmpl	8(%ecx), %eax
		jne	label_search_first_occurance_do_statement
	
	label_search_first_occurrance_break_do:
		
		cmpl	8(%ecx), %eax
		
		jne	label_search_first_occurrance_return_pos
		
		movl	-4(%ebp), %eax
		cmpl	$1, %eax
		je	label_search_first_occurrance_return_pos
		
		movl	$-2, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_search_first_occurrance_return_pos:
		
		movl	-4(%ebp), %eax
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_search_first_occurance_empty_list:
		
		movl	$-1, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret

################################## SearchLastOccurance ###########################################################

.globl	SearchLastOccurance
.type	SearchLastOccurance, @function

SearchLastOccurance:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %eax				#*pHead
	
	cmpl	$0, %eax
	je	label_search_last_occurance_empty_list
	
	movl	$1, -4(%ebp)				#iPos = 1
	movl	$0, -8(%ebp)				#iLast = 0
	
	movl	16(%ebp), %edx				#iKey
	movl	12(%ebp), %ecx				#*pTail
	
	label_search_last_occurance_do_statement:
		
		cmpl	%edx, 4(%eax)
		jne	label_search_last_occurrance_next_node
		
		movl	-4(%ebp), %ebx			#iPos
		movl	%ebx, -8(%ebp)			#iLast
		
		label_search_last_occurrance_next_node:
			
			addl	$1, -4(%ebp)
			movl	8(%eax), %eax
	
		cmpl	8(%ecx), %eax
		jne	label_search_last_occurance_do_statement
	
	movl	-8(%ebp), %eax				#iLast
	
	cmpl	$0, %eax
	jne	label_search_last_occurrance_data_found
	
	movl	$-2, %eax
	
	label_search_last_occurrance_data_found:
		
		movl	%ebp, %esp
		popl	%ebp
		ret
		
	label_search_last_occurance_empty_list:
		
		movl	$-1, %eax
		movl	%ebp, %esp
		popl	%ebp
		ret

################################### SearchAllOccurances #################################################

.globl	SearchAllOccurances
.type	SearchAllOccurances, @function

SearchAllOccurances:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)				#iCount = 0
	
	movl	8(%ebp), %eax				#*pHead
	
	cmpl	$0, %eax
	je	label_search_all_occurances_empty_list
	
	movl	16(%ebp), %edx				#iKey
	movl	12(%ebp), %ecx				#*pTail
	
	label_search_all_occurance_do_statement:
		
		cmpl	%edx, 4(%eax)
		jne	label_search_all_occurrances_next_node
		
		addl	$1, -4(%ebp)
		
		label_search_all_occurrances_next_node:
			
			movl	8(%eax), %eax
	
		cmpl	8(%ecx), %eax
		jne	label_search_all_occurance_do_statement
			
	label_search_all_occurances_empty_list:
		
		movl	-4(%ebp), %eax	
		movl	%ebp, %esp
		popl	%ebp
		ret

######################################### CountNode #####################################################

.globl	CountNode
.type	CountNode, @function

CountNode:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$0, -4(%ebp)				#iCount = 0
	
	movl	8(%ebp), %eax				#*pHead
	
	cmpl	$0, %eax
	je	label_count_node_empty_list
	
	movl	12(%ebp), %edx				#*pTail
	
	label_count_node_do_statement:
		
		addl	$1, -4(%ebp)	
		movl	8(%eax), %eax
		
		cmpl	8(%edx), %eax
		jne	label_count_node_do_statement
			
	label_count_node_empty_list:
		
		movl	-4(%ebp), %eax	
		movl	%ebp, %esp
		popl	%ebp
		ret

############################################## Display #########################################################

.globl	Display
.type	Display, @function

Display:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$msg_display_print_linked_list_is, (%esp)
	call	printf
	
	movl	8(%ebp), %eax					#*pHead
		
	cmpl	$0, %eax
	je	label_display_empty_list
	
	label_display_do_statement:
			
		movl	4(%eax), %eax				#pHead -> iData
		
		movl	$msg_display_print_data, (%esp)
		movl	%eax, 4(%esp)
		call	printf
	
		movl	8(%ebp), %eax					#*pHead	
		movl	12(%ebp), %edx					#*pTail
	
		movl	8(%eax), %eax					#pHead = pHead->pNext
		movl	%eax, 8(%ebp)
		 
		cmpl	8(%edx), %eax					#pHead != pTail->pNext
		jne	label_display_do_statement
	
	movl	$msg_display_print_carriage_return, (%esp)
	call	printf
	
	movl	%ebp, %esp
	popl	%ebp
	ret	
		
	label_display_empty_list:
		
		movl	$msg_display_print_empty, (%esp)
		call	printf
			
		movl	%ebp, %esp
		popl	%ebp
		ret

########################################### DeleteAllNodes #################################################

.globl	DeleteAllNodes
.type	DeleteAllNodes, @function

DeleteAllNodes:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	8(%ebp), %eax					#ppHead
	movl	12(%ebp), %edx					#ppTail
	
	movl	(%eax), %ecx					#*ppHead
	movl	(%edx), %ebx					#*ppTail
	
	cmpl	$0, %ecx
	je	label_delete_all_nodes_empty_list
	
	jmp	label_delete_all_nodes_while_condn
	
	label_delete_all_nodes_while_statement:
		
		movl	$0, (%ecx)
		movl	8(%ecx), %ecx				#(*ppHead)->pNext
		movl	%ecx, (%eax)
		
		movl	8(%ebx), %ebx				#(*ppTail)->pNext
		
		movl	$0, 8(%ebx)
				
		movl	%ebx, (%esp)
		call	free
		
		movl	8(%ebp), %eax					#ppHead
		movl	12(%ebp), %edx					#ppTail
		
		movl	(%eax), %ecx					#*ppHead
		movl	(%edx), %ebx					#*ppTail
		
		movl	%ecx, 8(%ebx)
		
	label_delete_all_nodes_while_condn:
	
		cmpl	%ebx, %ecx					#*ppHead != *ppTail
		jne	label_delete_all_nodes_while_statement	
	
	movl	$0, 8(%ecx)
	movl	$0, (%ecx)
	
	movl	%ecx, (%esp)
	call	free
	
	movl	8(%ebp), %eax					#ppHead
	movl	12(%ebp), %edx					#ppTail
	
	movl	$0, (%eax)
	movl	$0, (%edx)
	
	movl	$msg_delete_all_nodes_print_deleted_all_nodes, (%esp)
	call	printf
	
	label_delete_all_nodes_empty_list:
		
		movl	%ebp, %esp
		popl	%ebp
		ret
	
############################################ ReverseDisplay ###############################################

.globl	ReverseDisplay
.type	ReverseDisplay, @function

ReverseDisplay:
	
	pushl	%ebp
	movl	%esp, %ebp
	
	subl	$16, %esp
	
	movl	$msg_reverse_display_print_reverse_linked_list_is, (%esp)
	call	printf
	
	movl	12(%ebp), %eax				#*pTail
	
	cmpl	$0, %eax
	je	label_reverse_display_empty_list
	
	label_reverse_display_do_statement:
		
		movl	4(%eax), %edx			#(*ptail)->iData
		movl	$msg_display_print_data, (%esp)
		movl	%edx, 4(%esp)
		call	printf
		
		movl	12(%ebp), %eax				#*pTail
		movl	8(%ebp), %edx				#*pHead
		
		movl	(%eax), %eax				#pTail = (*pTail) -> pPrev
		movl	%eax, 12(%ebp)
		
		cmpl	(%edx), %eax
		jne	label_reverse_display_do_statement
	
	movl	$msg_display_print_carriage_return, (%esp)
	call	printf
	
	movl	%ebp, %esp
	popl	%ebp
	ret	
		
	label_reverse_display_empty_list:
		
		movl	$msg_display_print_empty, (%esp)
		call	printf
			
		movl	%ebp, %esp
		popl	%ebp
		ret

