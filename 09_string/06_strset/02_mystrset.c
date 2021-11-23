#include <stdio.h>

char *mystrset(char *, const char);

int main()
{
	char str[20],ch;

	printf("\n\nEnter The String:\t");
	gets(str);

	printf("\n\nEnter The Character To Set:\t");
	scanf("%c",&ch);
	
	mystrset(str,ch);

	printf("\n\nNow String Is:\t");
	puts(str);

	return 0;
}

char *mystrset(char *pStr, const char ch)
{
	int iCounter = 0;
	
	while( pStr[iCounter] != '\0' )
	{
		pStr[iCounter] = ch;
		iCounter++;
	}
	
	return pStr;
}

