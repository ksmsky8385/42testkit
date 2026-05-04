#include <stdio.h>
#include <stdlib.h>

char *ft_strjoin(int size, char **strs, char *sep);

int main(void)
{
	char *strs[] = {"Pen", "PineApple", "Apple", "Pen"};
	char *sep = "~ ";
	int size = 4;
	char *res = ft_strjoin(size, strs, sep);
    printf("res = %s\n", res);
    free(res);
	return (0);
}
