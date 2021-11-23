#include <stdio.h>

int mystrlen(const char *);

int main()
{
	char *ptr = "Hello";
	char str[] = "Good";
	
	printf("\nThe Length Of Hello Is %d\n", mystrlen(ptr));
	printf("The Lenght of Good Is %d\n", mystrlen(str));
	printf("The Length of Morning Is %d\n", mystrlen("Morning"));
	
	return 0;
}

int mystrlen(const char *pStr)
{
	int iCounter = 0;
	
	while( pStr[iCounter] != '\0' )
	{
		iCounter++;
	}
	
	return iCounter;
}

