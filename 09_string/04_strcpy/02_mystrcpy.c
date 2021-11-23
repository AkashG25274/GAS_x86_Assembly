#include<stdio.h>

char *mystrcpy(char *, const char *);

int main()
{
	char source[20];
	char destination[20];

	printf("\n\nEnter Source String:\t");
	gets(source);
	printf("\n\nSource String Is:\t");
	puts(source);

	mystrcpy(destination,source);

	printf("\n\nDestination String Is:\t");
	puts(destination);
	
	return 0;
}

char *mystrcpy(char *pDestStr, const char *pSourceStr)
{
	int iCounter = 0;
	
	while( pSourceStr[iCounter] != '\0' )
	{
		pDestStr[iCounter] = pSourceStr[iCounter];
		iCounter++;
	}
	
	pDestStr[iCounter] = '\0';
	
	return pDestStr;
}

