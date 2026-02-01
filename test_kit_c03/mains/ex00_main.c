#include <stdio.h>

int ft_strcmp(char *s1, char *s2);

int main()
{
	char str0[] = "abc";
	char str1[] = "abc";
	char str2[] = "aBc";
	char str3[] = "abcd";

	printf("char str0[] : %s\n", str0);
	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);

	printf("Returned ft_strcmp(str0, str1) : %d\n", ft_strcmp(str0, str1));
	printf("Returned ft_strcmp(str0, str2) : %d\n", ft_strcmp(str0, str2));
	printf("Returned ft_strcmp(str0, str3) : %d\n", ft_strcmp(str0, str3));
	return (0);
}
