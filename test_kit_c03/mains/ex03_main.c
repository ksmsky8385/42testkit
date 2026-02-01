#include <stdio.h>

char *ft_strncat(char *dest, char *src, unsigned int nb);

int main()
{
	char dest1[25] = "Pen PineApple ";
	char dest2[15] = "Pen PineApple ";
	char src[] = "Apple Pen";

	unsigned int n1 = 5;
	unsigned int n2 = 9;

	printf("char src[] : %s\n", src);
	printf("char dest1[25] : %s\n", dest1);
	printf("char dest2[15] : %s\n", dest2);
	printf("int n1 : %d\n", n1);
	printf("int n2 : %d\n", n2);

	printf("ft_strncat(dest1, src, n1) : %s\n", ft_strncat(dest1, src, n1));
	printf("ft_strncat(dest2, src, n2) : %s\n", ft_strncat(dest2, src, n2));

	return (0);
}