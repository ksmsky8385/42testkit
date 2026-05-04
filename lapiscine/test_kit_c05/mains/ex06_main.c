#include <stdio.h>
#include <time.h>

int ft_is_prime(int nb);

int main(void)
{
    clock_t start, end;
    double runtime;

    int nb0 = 0;
	int nb1 = 1;
	int nb2 = -7;
    int nb3 = 13;
    int nb4 = 901;
    int nb5 = 2147483647;

	printf("ft_is_prime(%d) = %d\n", nb0, ft_is_prime(nb0));
    printf("ft_is_prime(%d) = %d\n", nb1, ft_is_prime(nb1));
	printf("ft_is_prime(%d) = %d\n", nb2, ft_is_prime(nb2));
	printf("ft_is_prime(%d) = %d\n", nb3, ft_is_prime(nb3));
    printf("ft_is_prime(%d) = %d\n", nb4, ft_is_prime(nb4));

    start = clock();
    printf("ft_is_prime(%d) = %d\n", nb5, ft_is_prime(nb5));
    end = clock();
    runtime = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("runtime of ft_is_prime(%d) = %.2fs\n", nb5, runtime);
}