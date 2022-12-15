/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_stackmove_moul.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/19 13:19:33 by ggiannit          #+#    #+#             */
/*   Updated: 2022/12/05 18:12:04 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pushswap_moul.h"

void	ft_istswap_moul(t_stmoul *st_n)
{
	int	tmp;

	if (!st_n || !st_n->next)
		return ;
	tmp = st_n->num;
	st_n->num = st_n->next->num;
	st_n->next->num = tmp;
}

void	ft_ist_from_to_moul(t_stmoul **from, t_stmoul **to)
{
	t_stmoul	*node;

	if (!*from)
		return ;
	node = *from;
	*from = (*from)->next;
	ft_istadd_front_moul(to, node);
}

void	ft_ist_rot_moul(t_stmoul **st_n)
{
	t_stmoul *last;
	t_stmoul *head;

	head = *st_n;
	last = ft_istlast_moul(*st_n);
	last->next = *st_n;
	*st_n = (*st_n)->next;
	head->next = NULL;
}

t_stmoul	*ft_istpre_last_moul(t_stmoul *st_n)
{
	if (!st_n)
		return (NULL);
	while (st_n->next->next != NULL)
		st_n = st_n->next;
	return (st_n);
}

void	ft_ist_rerot_moul(t_stmoul **st_n)
{
	t_stmoul *new_last;
	t_stmoul *new_head;

	new_head = ft_istlast_moul(*st_n);
	new_last = ft_istpre_last_moul(*st_n);
	new_head->next = *st_n;
	*st_n = new_head;
	new_last->next = NULL;
}
