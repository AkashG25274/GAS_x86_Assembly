#include<stdio.h>
#include<stdlb.h>

int main(void)
{
	int iNo1;
	int iNo2;
	int iAns;
	
	printf("Enter two numbers:");
	scanf("%d%d", &iNo1, &iNo2);
	
	iAns = addition(iNo1, iNo2);
	printf("Answer is:%d", iAns);
	
	exit(0);
}
