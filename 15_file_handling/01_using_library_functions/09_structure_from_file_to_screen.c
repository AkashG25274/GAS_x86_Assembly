#include <stdio.h>

int main(void)
{
	FILE *pFile = NULL;
	
	struct student
	{
		char szName[40];
		int iRollNo;
		float fPerc;
	};
	
	struct student s;
	
	pFile = fopen("07_student_structure_from_keyboard_to_file.txt", "r");
	
	if( NULL == pFile )
	{
		printf("\nCan't Open File");
		return -1;
	}
	
	//fread(&s, sizeof(s), 1, pFile) == 1 when structure changes, i.e. no nned to change in fscanf
	while( fscanf(pFile, "%s %d %f", s.szName, &s.iRollNo, &s.fPerc) != EOF )
		printf("%s %d %f\n", s.szName, s.iRollNo, s.fPerc);
	
	fclose(pFile);
	pFile = NULL;
	
	return 0;
}

