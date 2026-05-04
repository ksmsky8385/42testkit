#include <stdio.h>
#include <stdlib.h>

int	ft_ultimate_range(int **range, int min, int max);

int main(void)
{
	int *range;
	int min = 5;
	int max1 = 10;
	int max2 = 5;
	int max3 = -1;
	int i;

	printf("int min = %d\n", min);
	printf("int max1 = %d\n", max1);
	printf("int max2 = %d\n", max2);
	printf("int max3 = %d\n", max3);

	int res1 = ft_ultimate_range(&range, min, max1);
	printf("ft_ultimate_range(*range, %d, %d) = ", min, max1);
	i = 0;
	while(i < res1)
    {
        printf("%d ", range[i]);
		i++;
    }
    printf("\nres1 = %d\n", res1);
    free(range);

	int res2 = ft_ultimate_range(&range, min, max2);
	printf("ft_ultimate_range(*range, %d, %d) = ", min, max2);
	i = 0;
	while(i < res2)
    {
        printf("%d ", range[i]);
		i++;
    }
    printf("\nres2 = %d\n", res2);
    free(range);

	int res3 = ft_ultimate_range(&range, min, max3);
	printf("ft_ultimate_range(*range, %d, %d) = ", min, max3);
	i = 0;
	while(i < res3)
    {
        printf("%d ", range[i]);
		i++;
    }
    printf("\nres3 = %d\n", res3);
    free(range);

	return (0);
}
