#include <stdio.h>

int ft_strncmp(char *s1, char *s2, unsigned int n);

int main()
{
	unsigned int n1 = 3;
	unsigned int n2 = 4;


	char str0[] = "abc";
	char str1[] = "abc";
	char str2[] = "aBc";
	char str3[] = "abcd";

	printf("char str0[] : %s\n", str0);
	printf("char str1[] : %s\n", str1);
	printf("char str2[] : %s\n", str2);
	printf("char str3[] : %s\n", str3);

	printf("Returned ft_strcmp(str0, str1, n1) : %d\n", ft_strncmp(str0, str1, n1));
	printf("Returned ft_strcmp(str0, str2, n1) : %d\n", ft_strncmp(str0, str2, n1));
	printf("Returned ft_strcmp(str0, str3, n1) : %d\n", ft_strncmp(str0, str3, n1));
	printf("Returned ft_strcmp(str0, str3, n2) : %d\n", ft_strncmp(str0, str3, n2));
	return (0);
}