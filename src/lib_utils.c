/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   lib_utils.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <ggiannit@student.42firenze.it    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/30 21:58:21 by ggiannit          #+#    #+#             */
/*   Updated: 2023/06/30 22:01:58 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_strncmp(const char *s1, const char *s2, size_t n)
{
	size_t	k;

	k = 0;
	if (!s1 || !s2)
		return (2);
	while (k < n && (s1[k] != '\0' || s2[k] != '\0'))
	{
		if (((unsigned char *)s1)[k] < ((unsigned char *)s2)[k])
			return (-1);
		if (((unsigned char *)s1)[k] > ((unsigned char *)s2)[k])
			return (1);
		k++;
	}
	return (0);
}

int	ft_atoi(const char *nptr)
{
	int	k;
	int	sgn;
	int	toi;

	k = 0;
	toi = 0;
	sgn = 1;
	while (nptr[k] == 32 || (nptr[k] >= 9 && nptr[k] <= 13))
		k++;
	if (nptr[k] == '-' || nptr[k] == '+')
	{
		if (nptr[k] == '-')
			sgn = -1;
		k++;
	}
	while (nptr[k] >= '0' && nptr[k] <= '9')
	{
		toi *= 10;
		toi += nptr[k] - 48;
		k++;
	}
	return (toi * sgn);
}
