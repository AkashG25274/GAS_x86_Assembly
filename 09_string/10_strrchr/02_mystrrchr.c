#include<stdio.h>

char *mystrrchr(const char *, const char);

int main()
{
	char str[20],ch;
	char *ptr;

	printf("\n\nEnter The String:\t");
	gets(str);

	printf("\n\nEnter Character To Be Found:\t");
	scanf("%c",&ch);
	
	ptr = mystrrchr(str,ch);
	
	if(ptr==NULL)
	{
		printf("\n\nCharacter Is Not Found\n");
	}
	else
	{
		printf("\n\nCharacter Is Found At %d Location\n",(ptr-str)+1);
	}
	
	return 0;
}

char *mystrrchr(const char *pStr, const char chCharToFound)
{	
	int iCounter = 0;
	
	while( pStr[iCounter] != '\0' )
	{
		iCounter++;	
	}
	
	iCounter--;
	
	while( iCounter >= 0 )
	{
		if( pStr[iCounter] == chCharToFound )
		{
			return &pStr[iCounter];
		}
		
		iCounter--;
	}
	
	return NULL;
}

