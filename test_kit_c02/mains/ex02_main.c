#include <stdio.h>

int	ft_str_is_alpha(char *str);

int	main(void)
{
	char str1[] = "";
	char str2[] = "abcdefg";
	char str3[] = "ABCDEFG";
	char str4[] = "abcd2fg";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_str_is_alpha(str1) : %d\n", ft_str_is_alpha(str1));
	printf("ft_str_is_alpha(str2) : %d\n", ft_str_is_alpha(str2));
	printf("ft_str_is_alpha(str3) : %d\n", ft_str_is_alpha(str3));
	printf("ft_str_is_alpha(str4) : %d\n", ft_str_is_alpha(str4));
	return (0);
}
