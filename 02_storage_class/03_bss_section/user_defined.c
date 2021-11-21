#include <stdio.h>
#include <stdlib.h>

int g_iNo;

int main(void)
{
	printf("Enter Number:");
	scanf("%d", &g_iNo);
	
	printf("Number is %d\n", g_iNo);
	
	exit(0);
}
