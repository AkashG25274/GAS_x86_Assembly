#include<stdio.h>

char *mystrncat(char *, const char *, int);

int main()
{
	char source[20],destination[40];
	int n;

	printf("\n\nEnter Destination String:\t");
	gets(destination);

	printf("\n\nEnter Source String:\t");
	gets(source);
	printf("\n\nEnter Value Of n:\t");
	scanf("%d",&n);

	mystrncat(destination,source,n);

	printf("\n\nConcatenated String Is:\t");
	puts(destination);
	
	return 0;
}

char *mystrncat(char *pDestStr, const char *pSourceStr, int iN)
{
	int iCounter1 = 0;
	int iCounter2 = 0;
	
	while( pDestStr[iCounter1] != '\0' )
	{
		iCounter1++;
	}
	
	while( ( iCounter2 < iN ) && ( pSourceStr[iCounter2] != '\0' ) )
	{
		pDestStr[iCounter1] = pSourceStr[iCounter2];
		
		iCounter2++;
		iCounter1++;
	}
	
	pDestStr[iCounter1] = '\0';
	
	return pDestStr;
}

