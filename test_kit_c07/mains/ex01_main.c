#include <stdio.h>
#include <stdlib.h>

int	*ft_range(int min, int max);

int main(void)
{
	int min = 5;
	int max1 = 10;
	int max2 = 5;
	int max3 = -1;
	int i;

	int *res1 = ft_range(min, max1);
	int *res2 = ft_range(min, max2);
	int *res3 = ft_range(min, max3);

	printf("int min = %d\n", min);
	printf("int max1 = %d\n", max1);
	printf("int max2 = %d\n", max2);
	printf("int max3 = %d\n", max3);

	printf("ft_range(%d, %d) = ", min, max1);
	i = 0;
	while(i < max1 - min)
    {
        printf("%d ", res1[i]);
		i++;
    }
    printf("\n");
    free(res1);

	printf("ft_range(%d, %d) = ", min, max2);
	i = 0;
	while(i < max2 - min)
    {
        printf("%d ", res2[i]);
		i++;
    }
        printf("\n");
	free(res2);

	printf("ft_range(%d, %d) = ", min, max3);
	i = 0;
	while(i < max3 - min)
    {
        printf("%d ", res3[i]);
		i++;
    }
        printf("\n");
	free(res3);

	return (0);
}
