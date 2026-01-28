#include <stdio.h>

void	ft_ft(int *nbr);

int	main(void)
{
	int	nbr;

	nbr = 0;
	printf("Before: %d\n", nbr);
	ft_ft(&nbr);
	printf("After: %d\n", nbr);
	return (0);
}
