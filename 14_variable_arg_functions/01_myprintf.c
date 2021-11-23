#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

int addition(int, ...);
int myprintf(const char *, ...);

int main(void)
{
	int iAns;
	iAns = myprintf("Hello\n");
	myprintf("Ans = %d\n", iAns);
	myprintf("%d\n",10);
	myprintf("%d\t%d\n", 10, 20);
	myprintf("%d\t%c\n", 30, 'A');
	myprintf("%c\t%d\n", 'B', 40);
	myprintf("%f\t%lf\n\n", 57.33f, 69.33);
	
	iAns = addition(2, 10, 20);
	myprintf("iAns = %d\n", iAns);
	iAns = addition(3, 10, 20, 30);
	myprintf("iAns = %d\n", iAns);
	iAns = addition(4, 10, 20, 30, 40);
	myprintf("iAns = %d\n", iAns);
	
	exit(0);
}

int myprintf(const char *pszFormat, ...)
{
	int iRet;
	va_list pArg;
	
	//pArg will point to data present after pszFormat pn stack
	
	va_start(pArg, pszFormat);
	
	iRet = vprintf(pszFormat, pArg);
	
	va_end(pArg);// pointer becomes NULL
	
	return iRet;
}

int addition(int iTotalParams, ...)
{
	int iSum, iCounter;
	va_list pArg;
	
	va_start(pArg, iTotalParams);
	
	iSum = 0;
	
	for(iCounter = 0; iCounter < iTotalParams; ++iCounter)
		iSum = iSum + va_arg(pArg, int);
	
	va_end(pArg);
	
	return iSum;
}

