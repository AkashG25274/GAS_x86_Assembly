/*
Code snippet is given by sir in the batch of assembly 2021 while explaining about "rodata" section.
*/
 
#include<stdio.h>

int main(void)
{
	char str[] = "Hello";
	printf("str is %s\n",str);
	
	str[0] = 'Z';
	printf("Now str is %s\n",str);

	str = "Bye";//error

	return 0;
}
