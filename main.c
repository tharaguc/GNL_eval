/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tharaguc <tharaguc@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/09 17:36:44 by tharaguc          #+#    #+#             */
/*   Updated: 2022/04/21 15:20:24 by tharaguc         ###   ########.fr       */
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
	fd = open("test.txt", O_RDONLY);
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
			printf("line: <<%s>>\n", line);
			free(line);
		}
	}
	else
		return (1);
	close(fd);
	return (0);
}
