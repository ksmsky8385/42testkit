#include <stdio.h>

int ft_recursive_power(int nb, int power);

int main(void)
{
	int nb1 = 5;
	int nb2 = -4;
	int nb3 = 0;
	int power1 = 3;
	int power2 = -4;
	int power3 = 0;

	printf("ft_recursive_power(%d, %d) = %d\n", nb1, power1, ft_recursive_power(nb1, power1));
	printf("ft_recursive_power(%d, %d) = %d\n", nb2, power1, ft_recursive_power(nb2, power1));
	printf("ft_recursive_power(%d, %d) = %d\n", nb1, power2, ft_recursive_power(nb1, power2));
	printf("ft_recursive_power(%d, %d) = %d\n", nb3, power3, ft_recursive_power(nb3, power3));

	return (0);
}