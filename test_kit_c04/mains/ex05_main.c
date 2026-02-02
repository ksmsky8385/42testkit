#include <stdio.h>

int	ft_atoi_base(char *str, char *base);

int	main(void)
{
	char str[] = "		---+--+1234ab567";
	char base1[] = "0123456789";
	char base2[] = "012";
	char base3[] = "01	";

	printf("ft_strncat(%s, %s) : %d\n", str, base1, ft_atoi_base(str, base1));
	printf("ft_strncat(%s, %s) : %d\n", str, base2, ft_atoi_base(str, base2));
	printf("ft_strncat(%s, %s) : %d\n", str, base2, ft_atoi_base(str, base3));
	return (0);
}