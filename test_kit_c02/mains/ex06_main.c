#include <stdio.h>

int	ft_str_is_printable(char *str);

int	main(void)
{
	char str1[] = "";
	char str2[] = "ABC";
	char str3[] = "AB\00";
	char str4[] = "AB\x01";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_str_is_printable(str1) : %d\n", ft_str_is_printable(str1));
	printf("ft_str_is_printable(str2) : %d\n", ft_str_is_printable(str2));
	printf("ft_str_is_printable(str3) : %d\n", ft_str_is_printable(str3));
	printf("ft_str_is_printable(str4) : %d\n", ft_str_is_printable(str4));
	return (0);
}
