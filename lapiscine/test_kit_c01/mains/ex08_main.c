#include <stdio.h>

void	ft_sort_int_tab(int *tab, int size);

int	main(void)
{
	int tab[] = {9, 7, 5, 5, 3};
	int size = 5;
	int i;

	printf("before sort: ");
	i = 0;
	while (i < size)
	{
		printf("%d", tab[i]);
		i++;
	}
	printf("\n");

	ft_sort_int_tab(tab, size);

	printf("after sort : ");
	i = 0;
	while (i < size)
	{
		printf("%d", tab[i]);
		i++;
	}
	printf("\n");
	return (0);
}

