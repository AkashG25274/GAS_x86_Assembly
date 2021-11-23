#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo1, iNo2;

	printf("Enter two numbers:\n");
	scanf("%d%d", &iNo1, &iNo2);

	printf("Multiplication:%d\n", iNo1 * iNo2);
	printf("Division:\nQuotient:%d\n", iNo1 / iNo2);
	printf("Remainder:%d\n", iNo1 % iNo2);
	
	exit(0);
}
