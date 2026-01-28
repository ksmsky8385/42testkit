#include <stdio.h>

void	ft_rev_int_tab(int *tab, int size);

int	main(void)
{
	int tab[] = {1, 2, 3, 4, 5};
	int size = 5;
	int i;

	printf("before: ");
	i = 0;
	while (i < size)
	{
		printf("%d", tab[i]);
		i++;
	}
	printf("\n");

	ft_rev_int_tab(tab, size);

	printf("after : ");
	i = 0;
	while (i < size)
	{
		printf("%d", tab[i]);
		i++;
	}
	printf("\n");

	return (0);
}

