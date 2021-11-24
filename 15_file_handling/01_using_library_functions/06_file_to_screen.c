#include <stdio.h>

int main(void)
{
	FILE *pFile = NULL;
	char szText[50];
	
	pFile = fopen("05_keyboard_to_text_file.txt", "r");
	if( NULL == pFile )
	{
		printf("\nCan't open file.\n");
		return -1;
	}
	
	while( fgets(szText, 49, pFile) != NULL )
		printf("%s", szText);
	
	fclose(pFile);
	pFile = NULL;
	
	return 0;
}
