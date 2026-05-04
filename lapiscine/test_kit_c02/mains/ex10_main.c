#include <stdio.h>

unsigned int ft_strlcpy(char *dest, char *src, unsigned int size);

int main()
{
	unsigned int size1 = 10;
	unsigned int size2 = 5;
	char src[] = "Hello 42!";
	char dest1[size1];
	char dest2[size2];
	unsigned int result1;
	unsigned int result2;

	result1 = size1 - ft_strlcpy(dest1, src, size1) -1;
	result2 = size2 - ft_strlcpy(dest2, src, size2) -1;

	printf("char src[] : %s\n", src);
	printf("Returned ft_strcpy - dest1 : %s\n", dest1);
	printf("dest1_size - src_str_num -\\0 = %d\n\n", result1);
	printf("Returned ft_strcpy - dest2 : %s\n", dest2);
	printf("dest1_size - src_str_num -\\0 = %d\n", result2);
	
	return (0);
}

