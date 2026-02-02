#include <stdio.h>

void	ft_putnbr(int nb);

int	main(void)
{
	int a = -2147483648;
	int b = 2147483647;
	int c = 18;
	int d = 0;
	printf("ft_putnbr(%d) = ", a);
	fflush(stdout);
	ft_putnbr(a);
	printf("\nft_putnbr(%d) = ", b);
	fflush(stdout);
	ft_putnbr(b);
	printf("\nft_putnbr(%d) = ", c);
	fflush(stdout);
	ft_putnbr(c);
	printf("\nft_putnbr(%d) = ", d);
	fflush(stdout);
	ft_putnbr(d);
	return (0);
}
