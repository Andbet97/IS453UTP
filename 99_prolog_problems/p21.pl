%P21 (*) Insert an element at a given position into a list.
%        Example:
%        ?- insert_at(alfa,[a,b,c,d],2,L).
%        L = [a,alfa,b,c,d]

insert_at(X, L, 1, R) :- append([X], L, R).
insert_at(X, [H|T], A, [H|R]) :- A > 1, NA is A-1, insert_at(X, T, NA, R).

%solucion pagina
% P21 (*): Insert an element at a given position into a list
% The first element in the list is number 1.

% insert_at(X,L,K,R) :- X is inserted into the list L such that it
%    occupies position K. The result is the list R.
%    (element,list,integer,list) (?,?,+,?)

%:- ensure_loaded(p20).

%insert_at(X,L,K,R) :- remove_at(X,R,K,L).
