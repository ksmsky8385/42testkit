#include <stdio.h>

void	ft_putnbr_base(int nbr, char *base);

int	main(void)
{
	int a = -2147483648;
	int b = 2147483647;
	char base1[] = "0123456789";
	char base2[] = "18!";
	char base3[] = "+1234";
	char base4[] = "2";
	char base5[] = "";
	printf("ft_putnbr_base(%d, %s) = ", a, base1);
	fflush(stdout);
	ft_putnbr_base(a, base1);
	printf("\nft_putnbr_base(%d, %s) = ", b, base1);
	fflush(stdout);
	ft_putnbr_base(b, base1);
	printf("\nft_putnbr_base(%d, %s) = ", b, base2);
	fflush(stdout);
	ft_putnbr_base(b, base2);
	printf("\nft_putnbr_base(%d, %s) = ", b, base3);
	fflush(stdout);
	ft_putnbr_base(b, base3);
	printf("\nft_putnbr_base(%d, %s) = ", b, base4);
	fflush(stdout);
	ft_putnbr_base(b, base4);
	printf("\nft_putnbr_base(%d, %s) = ", b, base5);
	fflush(stdout);
	ft_putnbr_base(b, base5);
	return (0);
}