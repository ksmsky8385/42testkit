#include <stdio.h>

char *ft_strcat(char *dest, char *src);

int main()
{
	char str1[25] = "Pen PineApple ";
	char str2[15] = "Pen PineApple ";
	char str3[] = "Apple Pen";

	printf("char str1[25] : %s\n", str1);
	printf("char str2[15] : %s\n", str2);
	printf("char str3[] : %s\n", str3);

	printf("ft_strcat(str1, str3) : %s\n", ft_strcat(str1, str3));
	printf("ft_strcat(str2, str3) : %s\n", ft_strcat(str2, str3));

	return (0);
}