#include <stdio.h>

void	ft_putstr_non_printable(char *str);

int main()
{
	char str1[] = "hello, 42!";
	char str2[] = "hello, \n4\n2!Ç";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("\nft_putstr_non_printable(str1) : ");
	fflush(stdout);
	ft_putstr_non_printable(str1);
	printf("\nft_putstr_non_printable(str2) : ");
	fflush(stdout);
	ft_putstr_non_printable(str2);
	return (0);
}

