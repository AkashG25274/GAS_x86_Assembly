#include <stdio.h>
#include <stdlib.h>

#define	LESS_THAN	1
#define	LESS_EQUAL	2
#define	GREATER_THAN	4
#define	GREATER_EQUAL	8
#define	EQUAL		16

void compare(int, int, char *);

int main(void)
{
	int 	iNo1, iNo2;
	char	cRelationalStatus;
	
	printf("Enter two numbers:\n");
	scanf("%d%d", &iNo1, &iNo2);
	
	compare(iNo1, iNo2, &cRelationalStatus);
	
	if( ( cRelationalStatus & LESS_THAN ) == LESS_THAN )
	{
		printf("%d is LESS THAN %d\n", iNo1, iNo2);
	}
	else
	{
		printf("%d is NOT LESS THAN %d\n", iNo1, iNo2);
	}
	
	if( ( cRelationalStatus & LESS_EQUAL ) == LESS_EQUAL )
	{
		printf("%d is LESS THAN OR EQUAL to %d\n", iNo1, iNo2);
	}
	else
	{
		printf("%d is NOT LESS THAN OR EQUAL to %d\n", iNo1, iNo2);
	}
	
	if( ( cRelationalStatus & GREATER_THAN ) == GREATER_THAN )
	{
		printf("%d is GREATER THAN %d\n", iNo1, iNo2);
	}
	else
	{
		printf("%d is NOT GREATER THAN %d\n", iNo1, iNo2);
	}
	
	if( ( cRelationalStatus & GREATER_EQUAL ) == GREATER_EQUAL )
	{
		printf("%d is GREATER THAN OR EQUAL to %d\n", iNo1, iNo2);
	}
	else
	{
		printf("%d is NOT GREATER THAN OR EQUAL to %d\n", iNo1, iNo2);
	}
	
	if( ( cRelationalStatus & EQUAL ) == EQUAL )
	{
		printf("%d is EQUAL to %d\n", iNo1, iNo2);
	}
	else
	{
		printf("%d is NOT EQUAL to %d\n", iNo1, iNo2);
	}
	
	exit(0);
}

void compare(int iNo1, int iNo2, char *pcRelationalStatus)
{
	*pcRelationalStatus = *pcRelationalStatus ^ *pcRelationalStatus;
	
	if( iNo1 < iNo2 )
	{
		//Less Than
		*pcRelationalStatus = *pcRelationalStatus | LESS_THAN;
		*pcRelationalStatus = *pcRelationalStatus | LESS_EQUAL;		
	}
	else if( iNo1 > iNo2 )
	{
		//Greater Than
		*pcRelationalStatus = *pcRelationalStatus | GREATER_THAN;
		*pcRelationalStatus = *pcRelationalStatus | GREATER_EQUAL;	
	}
	else
	{
		//Equal
		*pcRelationalStatus = *pcRelationalStatus | EQUAL;
		*pcRelationalStatus = *pcRelationalStatus | LESS_EQUAL;
		*pcRelationalStatus = *pcRelationalStatus | GREATER_EQUAL;
	}
}

