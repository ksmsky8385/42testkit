#include <stdio.h>

int ft_strlen(char *str);

int main(void)
{
	char str[] = "hello!";
	int strlen;

	printf("char str[] = \"%s\"\n", str);
	strlen = ft_strlen(str);
	printf("strlen = %d\n", strlen);
	return (0);
}

