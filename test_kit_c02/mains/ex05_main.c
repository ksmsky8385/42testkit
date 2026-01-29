#include <stdio.h>

int	ft_str_is_uppercase(char *str);

int	main(void)
{
	char str1[] = "";
	char str2[] = "ABCDEFGHIJKLMNOPQRSTYVWXYZ";
	char str3[] = "ABCDEFGHIJKLMN0PQRSTYVWXYZ";
	char str4[] = "ABCDEFGHlJKLMNOPQRSTYVWXYZ";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_str_is_uppercase(str1) : %d\n", ft_str_is_uppercase(str1));
	printf("ft_str_is_uppercase(str2) : %d\n", ft_str_is_uppercase(str2));
	printf("ft_str_is_uppercase(str3) : %d\n", ft_str_is_uppercase(str3));
	printf("ft_str_is_uppercase(str4) : %d\n", ft_str_is_uppercase(str4));
	return (0);
}
