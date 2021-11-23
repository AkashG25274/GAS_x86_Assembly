#include <stdio.h>
#include <stdlib.h>

int main()
{
	int arr[3][2][4] = {10, 20, 30, 40, 50, 60, 70, 80, 90};

	printf("&arr = %d\n", &arr);
	printf("arr = %d\n", arr);
	printf("arr[0] = %d\n", arr[0]);
	printf("arr[0][0] = %d\n", arr[0][0]);
	printf("arr[0][0][0] = %d\n", arr[0][0][0]);
	printf("arr[1] = %d\n", arr[1]);
	printf("arr[1][0] = %d\n", arr[1][0]);
	printf("arr[1][0][0] = %d\n", arr[1][0][0]);
	printf("arr[2] = %d\n", arr[2]);
	printf("arr[2][0] = %d\n", arr[2][0]);
	printf("arr[2][0][0] = %d\n", arr[2][0][0]);
	printf("&arr + 1 = %d\n", &arr + 1);
	printf("arr + 1 = %d\n", arr + 1);
	printf("arr[0] + 1 = %d\n", arr[0] + 1);
	printf("arr[0][0] + 1 = %d\n", arr[0][0] + 1);
	printf("arr[0][0][0] + 1 = %d\n", arr[0][0][0] + 1);
	printf("*arr = %d\n", *arr);
	printf("**arr = %d\n", **arr);
	printf("***arr = %d\n", ***arr);
	printf("*(*(*(arr+0)+1)+2) = %d\n", *(*(*(arr+0)+1)+2));
	printf("*(*(*(arr+1)+0)+1) = %d\n", *(*(*(arr+1)+0)+1));

	exit(0);
}