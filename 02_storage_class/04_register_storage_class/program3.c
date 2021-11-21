#include <stdio.h>
#include <stdlib.h>

void fun(void);

int main(void)
{
	register int iCounter = 10;
	printf("iCounter = %d\n", iCounter);
	
	fun();
	
	exit(0);
}

void fun(void)
{
	register int iCounter = 20;
	printf("In fun, iCounter is %d\n", iCounter);
}
