#include <stdio.h>

void ft_putstr(char *str);

int main(void)
{
	char str[] = "hello!";

	printf("char str[] = \"%s\"\n", str);
	ft_putstr(str);
	return (0);
}
