/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_exec_your_rules.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/05 09:33:33 by ggiannit          #+#    #+#             */
/*   Updated: 2022/12/16 09:36:13 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pushswap_moul.h"

int	ft_istsize_moul(t_stmoul *st_n)
{
	int	k;

	k = 0;
	while (st_n)
	{
		st_n = st_n->next;
		k++;
	}
	return (k);
}

int	ft_is_thanos_moul(t_stmoul *st_n, int n)
{
	if (!n)
		n = ft_istsize_moul(st_n);
	while (n-- > 1)
	{
		if (st_n->num > st_n->next->num)
			return (0);
		st_n = st_n->next;
	}
	return (1);
}

void	ft_swappalo(t_stmoul **st_a, t_stmoul **st_b, const char *the_rule)
{
	if (!ft_strncmp(the_rule, "rra", 3))
		ft_ist_rerot_moul(st_a);
	else if (!ft_strncmp(the_rule, "rrb", 3))
		ft_ist_rerot_moul(st_b);
	else if (!ft_strncmp(the_rule, "rrr", 3))
	{
		ft_ist_rerot_moul(st_a);
		ft_ist_rerot_moul(st_b);
	}
	else
		ft_swappalo_continues(st_a, st_b, the_rule);
}

void	ft_swappalo_continues(t_stmoul **st_a, t_stmoul **st_b,
		const char *the_rule)
{
	if (!ft_strncmp(the_rule, "sa", 2))
		ft_istswap_moul(*st_a);
	else if (!ft_strncmp(the_rule, "sb", 2))
		ft_istswap_moul(*st_b);
	else if (!ft_strncmp(the_rule, "pa", 2))
		ft_ist_from_to_moul(st_b, st_a);
	else if (!ft_strncmp(the_rule, "pb", 2))
		ft_ist_from_to_moul(st_a, st_b);
	else if (!ft_strncmp(the_rule, "ra", 2))
		ft_ist_rot_moul(st_a);
	else if (!ft_strncmp(the_rule, "rb", 2))
		ft_ist_rot_moul(st_b);
	else if (!ft_strncmp(the_rule, "rr", 2))
	{
		ft_ist_rot_moul(st_a);
		ft_ist_rot_moul(st_b);
	}
}

int	ft_exec_your_rules(t_stmoul **st_a, t_stmoul **st_b)
{
	int counter;
	int rulz_fd;
	char *nline;

	counter = 0;
	rulz_fd = open("lol", O_RDONLY);
	nline = get_next_line(rulz_fd);
	if (!nline)
		counter = -1;
	while (nline)
	{
		ft_swappalo(st_a, st_b, nline);
		ft_free_null(&nline);
		nline = get_next_line(rulz_fd);
		counter++;
	}
	close(rulz_fd);
	if (!ft_is_thanos_moul(*st_a, 0) || ft_istsize_moul(*st_b))
	//if (!ft_is_thanos_moul(*st_a, 0) || ft_istsize_moul(*st_b))
		return (0);
	return (counter);
}
