#include <stdio.h>

int ft_fibonacci(int index);

int	main(void)
{
	int index1 = 3;
	int index2 = 4;
	int index3 = -5;

	printf("fibonacci = 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ....\n");

	printf("t_fibonacci(%d) = %d\n", index1, ft_fibonacci(index1));
	printf("t_fibonacci(%d) = %d\n", index2, ft_fibonacci(index2));
	printf("t_fibonacci(%d) = %d\n", index3, ft_fibonacci(index3));
}