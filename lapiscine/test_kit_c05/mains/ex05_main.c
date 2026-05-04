#include <stdio.h>

int ft_sqrt(int index);

int	main(void)
{
	int index1 = 4;
	int index2 = 16;
	int index3 = 625;

	printf("ft_sqrt(%d) = %d\n", index1, ft_sqrt(index1));
	printf("ft_sqrt(%d) = %d\n", index2, ft_sqrt(index2));
	printf("ft_sqrt(%d) = %d\n", index3, ft_sqrt(index3));
}