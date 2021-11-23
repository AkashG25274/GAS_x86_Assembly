#include<stdio.h>

int mystrcmp(const char *, const char *);

int main()
{
	char string1[20],string2[20];
	int ch;

	printf("\n\nEnter String1:\t");
	gets(string1);

	printf("\n\nEnter String2:\t");
	gets(string2);
	
	ch = mystrcmp(string1,string2);
	
	printf("Return value:%d\n", ch);
		
	if( ch == 0 )
	{
		printf("\n\nBoth Strings Are Same\n");
	}
	else
	{
		printf("\n\nBoth Strings Are Diffrent\n");
	}
	
	return 0;
}

int mystrcmp(const char *pStr1, const char *pStr2)
{
	int iCounter1 = 0;
	
	while( pStr1[iCounter1] != '\0' )
	{
		if( pStr1[iCounter1] != pStr2[iCounter1] )
		{	
			break;
		}
		
		iCounter1++;
	}
	
	return pStr1[iCounter1] - pStr2[iCounter1];	
}

