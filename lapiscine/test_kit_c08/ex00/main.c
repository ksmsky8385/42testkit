#include <stdio.h>
#include "ft.h"

int	main(void)
{
	printf("--- ft_putchar test ---\n");
	ft_putchar('A');
	printf("\n\n");

	printf("--- ft_swap test ---\n");
	int a = 10;
	int b = 20;
	printf("Before: a = %d, b = %d\n", a, b);
	ft_swap(&a, &b);
	printf("After : a = %d, b = %d\n\n", a, b);

	printf("--- ft_putstr test ---\n");
	ft_putstr("Hello World!");
	printf("\n\n");

	printf("--- ft_strlen test ---\n");
	char *str = "12345";
	int len = ft_strlen(str);
	printf("String: %s, Length: %d\n\n", str, len);

	printf("--- ft_strcmp test ---\n");
	char *s1 = "Apple";
	char *s2 = "Apple";
	char *s3 = "Banana";
	
	int res1 = ft_strcmp(s1, s2);
	int res2 = ft_strcmp(s1, s3);
	
	printf("Compare Apple vs Apple : %d\n", res1);
	printf("Compare Apple vs Banana: %d\n", res2);

	return (0);
}