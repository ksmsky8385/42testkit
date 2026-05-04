#include <stdio.h>

int ft_recursive_factorial(int nb);

int main(void)
{
	int nb1 = 5;
	int nb2 = 0;
	int nb3 = -2;

	printf("int nb1 = %d\n", nb1);
	printf("int nb2 = %d\n", nb2);
	printf("int nb2 = %d\n", nb3);
	printf("ft_recursive_factorial(%d) = %d\n", nb1, ft_recursive_factorial(nb1));
	printf("ft_recursive_factorial(%d) = %d\n", nb2, ft_recursive_factorial(nb2));
	printf("ft_recursive_factorial(%d) = %d\n", nb3, ft_recursive_factorial(nb3));

	return (0);
}