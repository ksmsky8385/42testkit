#include <stdio.h>
#include <stdlib.h>

char	**ft_split(char *str, char *charset);

int	main(void)
{
	char	**res;
	int		i;
	int		j;
	char	*str;
	char	*charset;

	i = 0;
	str = "Pen PineApple Apple Pen";
	charset = "Apple";
	res = ft_split(str, charset);
	printf("ft_split(%s, %s) :\n", str, charset);
	while (res[i])
	{
		j = 0;
		while (res[i][j])
		{
			printf("%c", res[i][j]);
			j++;
		}
		printf("\n");
		i++;
	}
	i = 0;
	while (res[i])
		free(res[i++]);
	free(res);
}
