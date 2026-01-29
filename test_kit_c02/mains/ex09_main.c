#include <stdio.h>

char	*ft_strcapitalize(char *str);

int	main(void)
{
	char str1[] = "hi, how are you? 42words forty-two; fifty+and+one";
	char str2[] = "abcDEFg";

	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("ft_strcapitalize(str1) : %s\n", ft_strcapitalize(str1));
	printf("ft_strcapitalize(str2) : %s\n", ft_strcapitalize(str2));
	return (0);
}
