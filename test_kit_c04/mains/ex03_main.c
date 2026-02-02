#include <stdio.h>

int	ft_atoi(char *str);

int main()
{
	char str1[] = "		---+--+1234ab567";
	char str2[] = "321";
	char str3[] = "-abc1";

	printf("ft_strncat(%s) : %d\n", str1, ft_atoi(str1));
	printf("ft_strncat(%s) : %d\n", str2, ft_atoi(str2));
	printf("ft_strncat(%s) : %d\n", str3, ft_atoi(str3));
	return (0);
}