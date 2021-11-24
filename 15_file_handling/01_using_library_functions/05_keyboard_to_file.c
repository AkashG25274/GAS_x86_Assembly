#include <stdio.h>
#include <string.h>

int main(void)
{
	FILE *pFile = NULL;
	char szText[50];
	char *pText;
	
	pFile = fopen("05_keyboard_to_text_file.txt", "w");
	if( NULL == pFile )
	{
		printf("\nCant open file\n");
		return -1;
	}
	
	printf("\nEnter strings:\n");
	gets(szText);
	
	while( strlen(szText) > 0 )
	{
		fputs(szText, pFile);
		fputs("\n", pFile);
		
		gets(szText);
	}
	
	fclose(pFile);
	pFile = NULL;
	
	return 0;
}
