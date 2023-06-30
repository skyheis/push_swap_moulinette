/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pushswap_moul.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <ggiannit@student.42firenze.it    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/15 22:48:31 by ggiannit          #+#    #+#             */
/*   Updated: 2023/06/30 22:37:09 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PUSHSWAP_MOUL_H
# define PUSHSWAP_MOUL_H

# include <stdlib.h>
# include <unistd.h>
# include "libft.h"

typedef struct s_stmoul
{
	int				num;
	struct s_stmoul	*next;
}	t_stmoul;

void		ft_print_stack(t_stmoul *st_a, t_stmoul *st_b);
int			ft_exec_your_rules(t_stmoul **st_a, t_stmoul **st_b);
void		ft_swappalo(t_stmoul **st_a, t_stmoul **st_b, const char *the_rule);
void		ft_swappalo_continues(t_stmoul **st_a, t_stmoul **st_b, const char *the_rule);
int			ft_is_thanos_moul(t_stmoul *st_n, int n);
int			ft_istsize_moul(t_stmoul *st_n);
t_stmoul	*ft_istnew_moul(int	atoi);
void		ft_istadd_front_moul(t_stmoul **st_n, t_stmoul *newone);
void		ft_istadd_back_moul(t_stmoul **st_n, t_stmoul *newone);
t_stmoul	*ft_istlast_moul(t_stmoul *st_n);
void		ft_istclear_moul(t_stmoul **st_n);
void		ft_istswap_moul(t_stmoul *st_n);
void		ft_ist_from_to_moul(t_stmoul **from, t_stmoul **to);
void		ft_ist_rot_moul(t_stmoul **st_n);
t_stmoul	*ft_istpre_last_moul(t_stmoul *st_n);
void		ft_ist_rerot_moul(t_stmoul **st_n);


#endif
