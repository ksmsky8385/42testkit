#include <stdio.h>

int ft_find_next_prime(int nb);

int main(void)
{

    int nb0 = 0;
	int nb1 = 1;
	int nb2 = 8;
    int nb3 = 13;
    int nb4 = 901;
    int nb5 = 2147483641;

	printf("ft_find_next_prime(%d) = %d\n", nb0, ft_find_next_prime(nb0));
    printf("ft_find_next_prime(%d) = %d\n", nb1, ft_find_next_prime(nb1));
	printf("ft_find_next_prime(%d) = %d\n", nb2, ft_find_next_prime(nb2));
	printf("ft_find_next_prime(%d) = %d\n", nb3, ft_find_next_prime(nb3));
    printf("ft_find_next_prime(%d) = %d\n", nb4, ft_find_next_prime(nb4));
    printf("ft_find_next_prime(%d) = %d\n", nb5, ft_find_next_prime(nb5));

}