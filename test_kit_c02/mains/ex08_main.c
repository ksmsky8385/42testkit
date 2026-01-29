#include <stdio.h>

char	*ft_strlowcase(char *str);

int	main(void)
{
	char str1[] = "ABCDEFG";
	char str2[] = "abcDEFg";
	char str3[] = "AB****G";
	char str4[] = "1234567";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_strlowcase(str1) : %s\n", ft_strlowcase(str1));
	printf("ft_strlowcase(str2) : %s\n", ft_strlowcase(str2));
	printf("ft_strlowcase(str3) : %s\n", ft_strlowcase(str3));
	printf("ft_strlowcase(str4) : %s\n", ft_strlowcase(str4));
	return (0);
}
