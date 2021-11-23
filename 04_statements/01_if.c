#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo;
	
	printf("Enter number:\n");
	scanf("%d", &iNo);
	
	if( iNo % 2 == 0 )
	{
		printf("Number is even:\n");
	}
	
	exit(0);
}
