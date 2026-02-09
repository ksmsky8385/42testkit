#include <stdio.h>
#include <stdlib.h>

char	*ft_convert_base(char *nbr, char *base_from, char *base_to);

int	main(void)
{
	char *nbr = "--+---1234a5";
	char *base_from = "01";
	char *base_to = "012";

	char *res = ft_convert_base(nbr, base_from, base_to);

	printf("nbr = %s\n", nbr);
	printf("base_from = %s\n", base_from);
	printf("base_to = %s\n", base_to);
	printf("res = %s\n", res);
	free(res);

}