#include <stdio.h>
#include <stdlib.h>

int g_iNo1, g_iNo2, g_iAns;

int main(void)
{
	printf("Enter two numbers:\t");
	scanf("%d%d", &g_iNo1, &g_iNo2);
	
	asm
	(
		"pusha\n\t"
		"movl	g_iNo1, %eax\n\t"
		"movl	g_iNo2, %edx\n\t"
		"addl	%eax, %edx\n\t"
		"movl	%edx, g_iAns\n\t"
		"popa\n\t"
	);
	
	printf("Answer is %d\n", g_iAns);
	exit(0);
}

