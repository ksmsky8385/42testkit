#include <stdio.h>

char	*ft_strupcase(char *str);

int	main(void)
{
	char str1[] = "abcdefg";
	char str2[] = "abcDEFg";
	char str3[] = "ab****g";
	char str4[] = "1234567";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);
	printf("char str4[] : %s\n", str4);
	printf("ft_strupcase(str1) : %s\n", ft_strupcase(str1));
	printf("ft_strupcase(str2) : %s\n", ft_strupcase(str2));
	printf("ft_strupcase(str3) : %s\n", ft_strupcase(str3));
	printf("ft_strupcase(str4) : %s\n", ft_strupcase(str4));
	return (0);
}
