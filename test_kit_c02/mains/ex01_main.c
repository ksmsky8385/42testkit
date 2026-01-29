#include <unistd.h>
#include <stdio.h>
#include <string.h>

char	*ft_strncpy(char *dest, char *src, unsigned int n);

int main()
{
	int nbr;
	char src[] = "Hello 42!";
	nbr = 20;
	char dest[nbr + 1];
	int i;
	
	printf("char src[] : %s\n", src);
	printf("cpy nbr : %d\n", nbr);
	printf("Returned    strncpy dest : %s\n", strncpy(dest, src, nbr));
	printf("Returned ft_strncpy dest : %s\n", ft_strncpy(dest, src, nbr));
	printf("real dest array : ");
	fflush(stdout);
	
	i = 0;
	while (i <= nbr)
	{
		if (dest[i] == '\0')
			write(1, "\\0", 2);
		else
			write(1, &dest[i], 1);
		i ++;
	}
	return (0);
}
