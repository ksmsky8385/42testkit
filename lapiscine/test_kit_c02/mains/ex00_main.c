#include <stdio.h>
#include <string.h>

char *ft_strcpy(char *dest, char *src);

int main()
{
	char src[] = "Hello 42!";
	char dest1[20];
	char dest2[2];
	printf("char src[] : %s\n", src);
	printf("Returned    strcpy - dest1 : %s\n", strcpy(dest1, src));
	printf("Returned ft_strcpy - dest1 : %s\n", ft_strcpy(dest1, src));
	printf("Returned    strcpy - dest2 : %s\n", strcpy(dest2, src));
	printf("Returned ft_strcpy - dest2 : %s\n", ft_strcpy(dest2, src));
	return (0);
}
