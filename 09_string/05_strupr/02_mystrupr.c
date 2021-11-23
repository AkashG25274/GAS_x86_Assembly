#include <stdio.h>

char *mystrupr(char *mystrupr);

int main()
{
	char str[20];
	
	printf("\n\nEnter The String:\t");
	gets(str);
	
	mystrupr(str);
	
	printf("\nString In Upper Case Is:\t");	
	puts(str);

	return 0;
}

char *mystrupr(char *pStr)
{
	int iCounter = 0;
	
	while( pStr[iCounter] != '\0' )
	{
		if( pStr[iCounter] >= 97 && pStr[iCounter] <= 122 )
		{
			pStr[iCounter] = pStr[iCounter] - 32;
		}
		
		iCounter++;
	}
	
	return pStr;
}

