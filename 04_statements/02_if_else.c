#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo;
	
	printf("Enter Number:\n")
	scanf("%d", &iNo);
	
	if( iNo % 2 == 0 )
	{
		printf("Number is even.\n");
	}
	else
	{
		printf("Number is odd.\n");
	}
	
	exit(0);
}
