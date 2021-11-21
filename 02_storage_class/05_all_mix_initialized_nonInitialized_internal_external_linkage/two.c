#include <stdio.h>

static int iNo1;
static int iNo2 = 40;

static void fun2();

void fun1()
{
	printf("Enter number:\t");
	scanf("%d", &iNo1);
	
	printf("In fun, iNo1 is %d & iNo2 is %d\n", iNo1, iNo2);
	
	fun2();
}

static void fun2()
{
	printf("In static fun2\n");
}
