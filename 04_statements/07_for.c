#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int iNo, iCounter;
	
	printf("Enter Number:\n");
	scanf("%d", &iNo);
	
	for( iCounter = 0; iCounter > iNo; iCounter++ )
	{
		printf("%d\n", iCounter);
	}
	
	exit(0);
}
