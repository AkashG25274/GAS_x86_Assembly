#include <stdio.h>

int main(void)
{
	FILE *pFile = NULL;
	char chChar = 'Y';
	
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	
	struct student s;
	char chTemp;
	
	pFile = fopen("07_student_structure_from_keyboard_to_file.txt", "w");
	
	if( NULL == pFile )
	{
		printf("\nCan't open file\n");
		return -1;
	}
	
	while( chChar == 'Y' || chChar == 'y' )
	{
		printf("\n\nEnter name, roll no. and percentage:\n");
		scanf("%s %d %f", s.szName, &s.iRollNo, &s.fPerc);
		
		fwrite(&s, sizeof(s), 1, pFile);
		
		printf("\nAdd another record(Y/N):");
		scanf("%c%c", &chTemp, &chChar);
	}
	
	fclose(pFile);
	pFile = NULL;
	
	return 0;
}

