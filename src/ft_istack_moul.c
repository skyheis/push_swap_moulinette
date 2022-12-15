/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_istack_moul.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/17 15:04:33 by ggiannit          #+#    #+#             */
/*   Updated: 2022/12/05 18:11:14 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pushswap_moul.h"

void	ft_istclear_moul(t_stmoul **st_n)
{
	t_stmoul	*tmp;

	tmp = NULL;
	while (*st_n)
	{
		tmp = (*st_n)->next;
		free(*st_n);
		(*st_n) = tmp;
	}
}

t_stmoul	*ft_istlast_moul(t_stmoul *st_n)
{
	if (st_n == NULL)
		return (st_n);
	while (st_n->next != NULL)
		st_n = st_n->next;
	return (st_n);
}

void	ft_istadd_back_moul(t_stmoul **st_n, t_stmoul *newone)
{
	t_stmoul	*last_node;

	if (*st_n == NULL)
		*st_n = newone;
	else
	{
		last_node = ft_istlast_moul(*st_n);
		last_node->next = newone;
	}
}

void	ft_istadd_front_moul(t_stmoul **st_n, t_stmoul *newone)
{
	newone->next = *st_n;
	*st_n = newone;
}

t_stmoul	*ft_istnew_moul(int	atoi)
{
	t_stmoul	*newone;

	newone = (t_stmoul *) malloc(sizeof(t_stmoul));
	if (!newone)
		return (NULL);
	newone->num = atoi;
	newone->next = NULL;
	return (newone);
}
