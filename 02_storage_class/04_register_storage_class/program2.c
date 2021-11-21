#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	register int iCounter1 = 10;
	register int iCounter2 = 20;
	register int iCounter3 = 30;
	register int iCounter4 = 40;
	register int iCounter5 = 50;

	printf("iCounter1 is %d\n", iCounter1);
	printf("iCounter2 is %d\n", iCounter2);
	printf("iCounter3 is %d\n", iCounter3);
	printf("iCounter4 is %d\n", iCounter4);
	printf("iCounter5 is %d\n", iCounter5);
	
	exit(0);
}
