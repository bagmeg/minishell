#include "minishell.h"

t_list	*pp_lstnew(char *content, int id)
{
	t_list	*node;

	node = (t_list *)malloc(sizeof(t_list));
	if (node == NULL)
		return (0);
	pp_memset(node, 0, sizeof(t_list));
	node->content = content;
	node->id = id;
	node->next = NULL;
	node->prev = NULL;
	return (node);
}

t_list	*pp_lstlast(t_list *lst)
{
	if (lst == NULL)
		return (0);
	while (lst->next != NULL)
		lst = lst->next;
	return (lst);
}

void	pp_lstadd_back(t_list **lst, t_list *new)
{
	t_list	*last;

	if (lst == NULL || new == NULL)
		return ;
	if (*lst == NULL)
		*lst = new;
	else
	{
		last = pp_lstlast(*lst);
		new->next = last->next;
		new->prev = last;
		new->prev->next = new;
		if (new->next != NULL)
			new->next->prev = new;
	}
}

void	pp_lstadd_front(t_list **lst, t_list *new)
{
	t_list	*begin;

	if (lst == NULL || new == NULL)
		return ;
	if (*lst == NULL)
		*lst = new;
	else
	{
		begin = *lst;
		new->next = begin;
		new->prev = begin->prev;
		if (new->prev != NULL)
			new->prev->next = new;
		new->next->prev = new;
	}
}

void	pp_lstdelone(t_list *lst)
{
	if (lst == NULL)
		return ;
	if (lst->prev != NULL)
		lst->prev->next = lst->next;
	if (lst->next != NULL)
		lst->next->prev = lst->prev;
	free(lst->content);
	free(lst);
}

int	pp_lstsize(t_list *lst)
{
	int	i;

	i = 0;
	while (lst != NULL)
	{
		i++;
		lst = lst->next;
	}
	return (i);
}

