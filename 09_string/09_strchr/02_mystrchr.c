#include<stdio.h>

char *mystrchr(const char *, const char);

int main()
{
	char str[20],ch;
	char *ptr;

	printf("\n\nEnter The String:\t");
	gets(str);

	printf("\n\nEnter Character To Be Found:\t");
	scanf("%c",&ch);
	
	ptr = mystrchr(str,ch);
	
	if( ptr == NULL )
	{
		printf("\n\nCharacter Is Not Found\n");
	}
	else
	{
		printf("\n\nCharacter Is Found At %d Location\n",(ptr-str)+1);
	}
	
	return 0;
}

char *mystrchr(const char *pStr, const char chCharToFind)
{
	int iCounter = 0;
	
	while( pStr[iCounter] != '\0' )
	{
		if( pStr[iCounter] == chCharToFind )
		{
			return &pStr[iCounter];
		}
		
		iCounter++;
	}
	
	return NULL;
}

