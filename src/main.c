/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 22:48:04 by ggiannit          #+#    #+#             */
/*   Updated: 2022/12/15 11:29:21 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pushswap_moul.h"

int	ft_check_duble_int(t_stmoul *st_n)
{
	t_stmoul	*tmp;

	tmp = NULL;
	while (st_n->next)
	{
		tmp = st_n->next;
		while (tmp)
		{
			if (st_n->num == tmp->num)
					return (1);
			tmp = tmp->next;
		}
		st_n = st_n->next;
	}
	return (0);
}

int	ft_check_str(const char *avac)
{
	int	k;

	k = 0;
	while (avac[k] == 32 || (avac[k] >= 9 && avac[k] <= 13))
		k++;
	if (avac[k] == '-' || avac[k] == '+')
		k++;
	while (avac[k] >= '0' && avac[k] <= '9')
		k++;
	if (avac[k] != '\0')
		return (0);
	return (1);
}

t_stmoul *ft_make_stack(int ac, const char **av)
{
	t_stmoul	*st_a;
	int			atoi;

	st_a = NULL;
	while (ac-- > 1)
	{
		if (!ft_check_str(av[ac]))
				return (NULL);
		atoi = ft_atoi(av[ac]);
		ft_istadd_front_moul(&st_a, ft_istnew_moul(atoi));
	}
	return (st_a);
}

void	ft_print_steps(int n_steps)
{
	if (!n_steps)
		ft_printf("Error\n");
	else
	{
		if (n_steps == -1)
			n_steps++;
		ft_printf("%d\n", n_steps);
	}
}


int main(int ac, const char **av)
{
	t_stmoul	*st_a;
	t_stmoul	*st_b;
	int			n_steps;

	if (ac < 2)
		return (1);
	n_steps = 0;
	st_a = ft_make_stack(ac, av);
	st_b = NULL;
	if (!st_a)
		return (1);
	if (ft_check_duble_int(st_a))
	{
		ft_istclear_moul(&st_a);
		return (1);
	}
	n_steps = ft_exec_your_rules(&st_a, &st_b);
	ft_print_steps(n_steps);
	ft_istclear_moul(&st_a);
	return (0);
}
