#include <iostream>

using std::cin;
using std::cout;
using std::endl;

int g_iNo1, g_iNo2, g_iAns;

int main(void)
{
	cout << "Enter two numbers:" << endl;
	cin >> g_iNo1 >> g_iNo2;

	asm
	(
		"pusha\n\t"
		"movl	g_iNo1, %eax\n\t"
		"movl	g_iNo2, %edx\n\t"
		"addl	%edx, %eax\n\t"
		"movl	%eax, g_iAns\n\t"
		"popa\n\t"
	);
	
	cout << "Answer is:" << g_iAns << endl;
	return 0;
}

