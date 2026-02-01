#include <stdio.h>

unsigned int ft_strlcat(char *dest, char *src, unsigned int size);

int main()
{
	char dest[25] = "Pen PineApple ";
	char src[] = "Apple Pen~";

	unsigned int size = 25;

	printf("char dest1[25] : %s\n", dest);
	printf("char src[] : %s\n", src);
	printf("int n2 : %d\n", size);

	unsigned int res = ft_strlcat(dest, src, size);
	printf("returned dest : %s\n", dest);
	printf("dest1_len + src_len : %d\n", res);


	return (0);
}

