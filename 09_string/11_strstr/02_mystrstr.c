#include<stdio.h>

char *mystrstr(const char *, const char *);

int main()
{
	char string1[20],string2[20],*ptr;

	printf("\n\nEnter The String:\t");
	gets(string1);

	printf("\n\nEnter String To Be Found:\t");
	gets(string2);

	ptr = mystrstr(string1,string2);

	if( ptr == NULL )
	{
		puts("\n\nString Not Found\n");
	}
	else
	{
		printf("\n\nString Is Found At %d Location\n",(ptr-string1)+1);
		printf("\n\nString Found In '%s'\n",ptr);
	}
	
	return 0;
}

char *mystrstr(const char *pStr, const char *pStrToFound)
{
	int iCounter1 = 0, iCounter2 = 0, iCounter3 = 0;
	
	while( pStr[iCounter1] != '\0' )
	{
		iCounter2 = iCounter1;
		
		while( ( pStrToFound[iCounter3] != '\0' ) &&
			( pStr[iCounter2] != '\0' ) )
		{
			if( pStr[iCounter2] != pStrToFound[iCounter3] )
			{
				iCounter1 = iCounter2 + 1;	//set index to next char
				iCounter3 = 0;			//reset iCounter3
				
				break;
			}
			
			iCounter2++;
			iCounter3++;
		}
		
		if( pStrToFound[iCounter3] == '\0' )
		{
			//substr found
			return 	&pStr[iCounter1];			
		}
	}

	return NULL;
}

