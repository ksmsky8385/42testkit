#include <stdio.h>

int	ft_str_is_lowercase(char *str);

int	main(void)
{
	char str1[] = "";
	char str2[] = "abcdefghijklmnopqrstuvwxyz";
	char str3[] = "abcdefghijkImnopqrstuvwxyz";
	char str4[] = "abcdefghijklmnopqrstuvw×yz";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_str_is_lowercase(str1) : %d\n", ft_str_is_lowercase(str1));
	printf("ft_str_is_lowercase(str2) : %d\n", ft_str_is_lowercase(str2));
	printf("ft_str_is_lowercase(str3) : %d\n", ft_str_is_lowercase(str3));
	printf("ft_str_is_lowercase(str4) : %d\n", ft_str_is_lowercase(str4));
	return (0);
}
