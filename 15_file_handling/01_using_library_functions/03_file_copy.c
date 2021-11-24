#include <stdio.h>

int main(void)
{
	FILE *pSourceFile = NULL, *pDestFile = NULL;
	char chChar;
	
	pSourceFile = fopen("03_source_file.txt", "r");
	if( NULL == pSourceFile )
	{
		printf("\nCant open source file.\n");
		return -1;
	}
	
	pDestFile = fopen("03_dest_file.txt", "w");
	if( NULL == pDestFile )
	{
		printf("\nCant open destination file.\n");
		fclose(pSourceFile);
		pSourceFile = NULL;
		
		return -1;
	}
	
	while( ( chChar = fgetc(pSourceFile) ) != EOF )
		fputc(chChar, pDestFile);
	
	fclose(pSourceFile);
	pSourceFile = NULL;
	
	fclose(pDestFile);
	pDestFile = NULL;
	
	printf("\nCopied Successfully.\n");
	
	return 0;
}

