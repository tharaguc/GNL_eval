/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   bonus.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tharaguc <tharaguc@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/08 19:33:53 by tharaguc          #+#    #+#             */
/*   Updated: 2022/05/13 00:55:22 by tharaguc         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int	main(void)
{
	int		fd[3];
	char	*line[3];
	int	i, j;

	j = 0;
	fd[0] = open("test0.txt", O_RDONLY);
	fd[1] = open("test1.txt", O_RDONLY);
	fd[2] = open("test2.txt", O_RDONLY);
	if (fd[0] && fd[1] && fd[2])
	{
		while (j < 3)
		{
			i = 0;
			while (i < 3) {	
				line[i] = get_next_line(fd[i]);
				printf("test%i >> %s\n", i, line[i]);
				free(line[i]);
				i++;
			}
			j++;
		}
	}
	else
		return (1);
	for (int i = 0; i < 3; i++) {
		close(fd[i]);
	}
	fflush(stdout);
	printf("\n\n<leaks>\n");
	system("leaks -q bonus");
	return (0);
}
