/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libftprintf.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/17 16:29:39 by ggiannit          #+#    #+#             */
/*   Updated: 2022/10/28 19:51:54 by ggiannit         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTPRINTF_H
# define LIBFTPRINTF_H

# include <stdarg.h>
# include <stdlib.h>
# include <stdint.h>
# include <unistd.h>
# include "libft.h"

typedef struct s_varpc
{
	char			ascii;
	size_t			length;
	ssize_t			prec;
	int				flag_32;
	int				flag_plus;
	int				flag_sharp;
	int				flag_dash;
	int				flag_zero;
	struct s_varpc	*next;
}	t_varpc;

t_varpc	*ft_svarnew(char ascii);
void	ft_svaradd_back(t_varpc **svar, t_varpc *new);
void	ft_svarclear(t_varpc **svar);
t_varpc	*ft_checkprintfstr(const char *str);
int		ft_handleprintf(t_varpc *svar, va_list vargo, char *str);
int		ft_pchandle(t_varpc **svar, va_list vargo);
size_t	ft_atoi_custom(const char *pc);
int		ft_checkdoubleflag(char pcv, t_varpc *svar);
int		ft_checkprecision(char **pc, t_varpc *svar);
int		ft_checkstrpc_gook(char *pc, t_varpc *svar);
t_varpc	*ft_checkstrpc_endok(char *pc);
int		ft_pcfinded(t_varpc **svar, char *pc);
int		ft_strpclen(char *pc);
void	ft_fill_c(t_varpc *svar, char c_var, char *c, size_t c_size);
char	*ft_prepare_c(t_varpc *svar, char c_var);
void	ft_fill_s(t_varpc *svar, char *s_var, char *s, size_t s_size);
char	*ft_prepare_s(t_varpc *svar, char *s_var);
int		ft_checkconflict_id(t_varpc *svar);
void	ft_adjust_idsize(t_varpc *svar, size_t *id_size,
			size_t itoa_orig_size, char itoa_0);
char	*ft_prepare_id(t_varpc *svar, int id_var);
void	ft_fill_id_0(t_varpc *svar, char *itoa_var, char *id, ssize_t ia_len);
void	ft_fill_id_1(t_varpc *svar, char *itoa_var, char *id, ssize_t ia_len);
int		ft_fill_id_1_32(t_varpc *svar, char *itoa_var,
			char *id, ssize_t ia_len);
char	*ft_idu_handle_zero(t_varpc *svar, char *id, char itoa_0);
void	ft_fill_u_0(t_varpc *svar, char *itoa_var, char *id, ssize_t ua_len);
void	ft_fill_u_1(t_varpc *svar, char *itoa_var, char *id, ssize_t ua_len);
int		ft_checkconflict_u(t_varpc *svar);
void	ft_adjust_usize(t_varpc *svar, size_t *u_size);
char	*ft_prepare_u(t_varpc *svar, unsigned int u_var);
int		ft_get_x_size(unsigned int x_var);
void	ft_put_x_var(t_varpc *svar, unsigned int x_var,
			char *x_spot, ssize_t x_orig_size);
void	ft_fill_x_0(t_varpc *svar, char *x_conv,
			char *x, ssize_t x_orig_size);
void	ft_fill_x_1(t_varpc *svar, char *x_conv,
			char *x, ssize_t x_orig_size);
void	ft_adjust_xsize(t_varpc *svar, unsigned int x_var, size_t *x_size);
char	*ft_x_handle_zero(t_varpc *svar, char *x,
			size_t x_size, size_t x_orig_size);
char	*ft_prepare_x(t_varpc *svar, unsigned int x_var);
void	ft_fill_p_0(t_varpc *svar, uintptr_t p_conv, char *p, size_t p_size);
void	ft_fill_p_1(t_varpc *svar, uintptr_t p_conv, char *p, size_t p_size);
size_t	ft_size_for_p(uintptr_t p_conv);
int		ft_handle_nil(t_varpc *svar);
char	*ft_prepare_p(t_varpc *svar, void *p_var);
char	*ft_lutoa(long unsigned int n);
int		ft_isa_c(t_varpc **svar, char c_var);
int		ft_isa_s(t_varpc **svar, char *s_var);
int		ft_isa_p(t_varpc **svar, void *p_var);
int		ft_isa_id(t_varpc **svar, int id_var);
int		ft_isa_ux(t_varpc **svar, unsigned int ux_var);
int		ft_putstr_pf_fd(const char *str, int fd);
size_t	ft_strlcpy_idu(t_varpc *svar, char *dst, const char *src, size_t size);
size_t	ft_strlcpy_x(t_varpc *svar, char *dst, const char *src, size_t size);
int		ft_printf(const char *str, ...);

/*char	*ft_testino(char *pc);
void	ft_svarprint(t_varpc *lol);*/

#endif
