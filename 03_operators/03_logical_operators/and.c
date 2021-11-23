#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo1, iNo2, iNo3, iAns;
	
	printf("Enter three numbers:\t");
	scanf("%d%d%d", &iNo1, &iNo2, &iNo3);
	
	iAns = iNo1 && iNo2++ && iNo3++;
	
	printf("iNo1 is %d\niNo2 is %d\niNo3 is %d\niAns is %d\n", iNo1, iNo2, iNo3, iAns);
	
	exit(0);
}
