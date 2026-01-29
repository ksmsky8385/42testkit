#include <stdio.h>

void	*ft_print_memory(void *addr, unsigned int size);

int	ft_strlen(char *str)
{
	int	len;

	len = 0;
	while (str[len] != '\0')
		len++;
	return (len);
}

int main()
{
	char *str = "Hi,\ni'm seunkang.\nNice to 42 you.\nㅗ<^ㅗ^>ㅗ";
	printf("char string : %s\n", str);
	ft_print_memory(str, ft_strlen(str));
	ft_print_memory(str, 0);
	return (0);
}

