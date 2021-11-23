#include <stdio.h>

char *mystrrev(char *);

int main()
{
	char string[20];

	printf("\n\nEnter The String:\t");
	gets(string);
	
	mystrrev(string);
	
	printf("\n\nReverse String Is:\t");
	puts(string);
	
	return 0;
}

char *mystrrev(char *pStr)
{
	int iCounter1 = 0, iCounter2 = 0;
	
	while( pStr[iCounter2] != '\0' )
	{
		iCounter2++;
	}
	
	iCounter2--;
	
	while( iCounter1 < iCounter2 )
	{
		pStr[iCounter1] = pStr[iCounter1] + pStr[iCounter2];
		pStr[iCounter2] = pStr[iCounter1] - pStr[iCounter2];
		pStr[iCounter1] = pStr[iCounter1] - pStr[iCounter2];
		
		iCounter1++;
		iCounter2--;
	}
	
	return pStr;
}

