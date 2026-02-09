#include <stdio.h>
#include <stdlib.h>

char	*ft_strdup(char *src);

int	main(void)
{
	char *str1 = "Hello 42!";
	char *str2 = "\0";

	char *res1 = ft_strdup(str1);
	char *res2 = ft_strdup(str2);

	printf("str1 = %s\n", str1);
	printf("str2 = %s\n", str2);
	printf("ft_strdup(%s) = %s\n", str1, res1);
	printf("ft_strdup(%s) = %s\n", str1, res2);
	free(res1);
	free(res2);

	return (0);
}
