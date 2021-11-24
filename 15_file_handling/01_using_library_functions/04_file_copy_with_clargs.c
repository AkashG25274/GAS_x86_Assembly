#include <stdio.h>

int main(int argc, char *argv[])
{
	FILE *pSourceFile = NULL, *pDestFile = NULL;
	char chChar;
	
	pSourceFile = fopen(argv[1], "r");
	if( NULL == pSourceFile )
	{
		printf("\nCant open source file.\n");
		return -1;
	}
	
	pDestFile = fopen(argv[2], "w");
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
	
	printf("\nCopied Successfully\n");
	
	return 0;
}

