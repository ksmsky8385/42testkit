#include <stdio.h>

char	*ft_strstr(char *str, char *to_find);

int	main(void)
{
	char	str[] = "Pen PineApple Apple Pen";
	char	to_find1[] = "";
	char	to_find2[] = "Apple";
	char	to_find3[] = "apple";

	printf("char str[] : %s\n", str);
	printf("char to_find1[] : %s\n", to_find1);
	printf("char to_find2[] : %s\n", to_find2);
	printf("char to_find3[] : %s\n", to_find3);
	printf("ft_strstr(to_find1) : %s\n", ft_strstr(str, to_find1));
	printf("ft_strstr(to_find2) : %s\n", ft_strstr(str, to_find2));
	printf("ft_strstr(to_find3) : %s\n", ft_strstr(str, to_find3));
	return (0);
}
