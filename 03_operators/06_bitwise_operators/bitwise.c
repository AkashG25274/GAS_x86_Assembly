#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo1, iNo2;
	
	printf("Enter two numbers:\n");
	scanf("%d%d", &iNo1, &iNo2);
	
	printf("And is %d\n", iNo1 & iNo2);
	printf("Or is %d\n", iNo1 | iNo2);
	printf("Xor is %d\n", iNo1 ^ iNo2);
	printf("Not of iNo2 is %d\n", ~iNo2);
	
	printf("iNo1 << 2 is %d\n", iNo1 << 2);
	printf("iNo2 >> 2 is %d\n", iNo1 >> 2);
	
	exit(0);
}
