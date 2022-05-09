/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tharaguc <tharaguc@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/09 17:36:44 by tharaguc          #+#    #+#             */
/*   Updated: 2022/05/09 13:17:07 by tharaguc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int	main(void)
{
	int		fd;
	char	*line;
	int	i;

	i = 0;
	fd = open("test0.txt", O_RDONLY);
	if (fd)
	{
		while (1)
		{
			line = get_next_line(fd);
			if (line == NULL)
			{
				free(line);
				break ;
			}
			printf("%s", line);
			free(line);
		}
	}
	else
		return (1);
	close(fd);
	printf("\n\n<leaks>\n");
	system("leaks -q mandatory");
	return (0);
}
