#include <stdio.h>

int main(void)
{
	FILE *pFile = NULL;
	int iChars = 0, iSpaces = 0, iTabs = 0, iNewlines = 0;
	char chChar;
	
	pFile = fopen("02_chars_spaces_tabs_newlines.txt", "r");
	
	if( NULL == pFile )
	{
		puts("Can't Open The File");
		return -1;
	}
	
	while( ( chChar = fgetc(pFile) ) != EOF )
	{		
		++iChars;
		
		switch( chChar )
		{
			case ' ':
				++iSpaces;
				break;
			
			case '\t':
				++iTabs;
				break;
			
			case '\n':
				++iNewlines;	
		}
	}
	
	fclose(pFile);
	
	pFile = NULL;
		
	printf("Total characters: %d\n", iChars);
	printf("Total spaces: %d\n", iSpaces);
	printf("Total tabs: %d\n", iTabs);
	printf("Total lines: %d\n", iNewlines);
		
	return 0;
}

/*
#akash@akash-Virtual-Machine:~/Documents/Personal/01_Assembly_Programs/15_file_handling/02_system_programming$ ld #02_char_spaces_tabs_newlines.o -o 02_char_spaces_tabs_newlines -e main -m elf_i386 -lc -dynmic-linker /lib/ld-linux.so.2
#02_char_spaces_tabs_newlines.o: In function `label_main_next_index':
#(.text+0x9a): undefined reference to `label_main_for_inner_loop'
#02_char_spaces_tabs_newlines.o: In function `label_main_next_index':
#(.text+0x9a): relocation truncated to fit: R_386_PC8 against undefined symbol `label_main_for_inner_loop'
*/

