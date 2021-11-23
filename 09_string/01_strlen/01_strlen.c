#include <stdio.h>
#include <string.h>

int main()
{
	char *ptr = "Hello";
	char str[] = "Good";
	
	printf("\nThe Length Of Hello Is %ld\n", strlen(ptr));
	printf("The Lenght of Good Is %ld\n", strlen(str));
	printf("The Length of Morning Is %ld\n", strlen("Morning"));
	
	return 0;
}
