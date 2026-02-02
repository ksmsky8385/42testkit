#include <stdio.h>

int	ft_atoi_base(char *str, char *base);

int main()
{
	char str1[] = "		---+--+1234ab567";
	char str2[] = "321";
	char str3[] = "-abc1";

	printf("ft_strncat(%s, %s) : %d\n", str1, str2, ft_atoi_base(str1, str2));
	printf("ft_strncat(%s, %s) : %d\n", str1, str3, ft_atoi_base(str1, str3));
	return (0);
}