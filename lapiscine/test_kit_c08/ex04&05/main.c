#include "ft_stock_str.h"
#include <stdio.h>
#include <stdlib.h>

struct s_stock_str	*ft_strs_to_tab(int ac, char **av);
void				ft_show_tab(struct s_stock_str *par);

void	clean_tab(struct s_stock_str *res)
{
	int	i;

	i = 0;
	while (res[i].str != 0)
	{
		free(res[i].copy);
		i++;
	}
	free(res);
}

int	main(void)
{
	char *av[] = {"abc", "def", "ghi"};
	int size = 3;

	t_stock_str *res = ft_strs_to_tab(size, av);
	ft_show_tab(res);
	clean_tab(res);
	return (0);
}