#include <stdio.h>

int main(void)
{
	FILE *pFile = NULL;
	char chChar;
	
	pFile = fopen("01_print_characters.txt", "r");
	
	if( NULL == pFile )
	{
		puts("\nCan't open file.\n");
		return -1;
	}
	
	while( ( chChar = fgetc(pFile) ) != EOF )
		printf("%c", chChar);
	
	fclose(pFile);
	
	pFile = NULL;
	
	return 0;
}

