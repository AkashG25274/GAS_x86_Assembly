#include<stdio.h>

char *mystrcat(char *, const char *);

int main()
{
	char source[20], destination[40];
	
	printf("\n\nEnter Destination String:\t");
	gets(destination);
	printf("\n\nEnter Source String:\t");
	gets(source);
	
	mystrcat(destination, source);
	
	printf("\n\nConcatenated String Is:\t");
	puts(destination);
	
	return 0;
}

char *mystrcat(char *pDestStr, const char *pSourceStr)
{
	int iCounter1 = 0;
	int iCounter2 = 0;
	
	while( pDestStr[iCounter1] != '\0' )
	{
		iCounter1++;
	}
	
	while( pSourceStr[iCounter2] != '\0' )
	{
		pDestStr[iCounter1] = pSourceStr[iCounter2];
		
		iCounter1++;
		iCounter2++;
	}
	
	pDestStr[iCounter1] = '\0';
	
	return pDestStr;
}

