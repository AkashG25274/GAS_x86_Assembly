#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo1 = 10, iNo2 = 20;
	int iAns1, iAns2;
	
	iAns1 = iNo1--;
	iAns2 = --iNo2;
	
	printf("iNo1 = %d\niNo2 = %d\niAns1 = %d\niAns2 = %d\n", iNo1, iNo2, iAns1, iAns2);
	
	exit(0);
}
