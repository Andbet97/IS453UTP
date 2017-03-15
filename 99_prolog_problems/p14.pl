%P14 (*) Duplicate the elements of a list.
%        Example:
%        ?- dupli([a,b,c,c,d],X).
%        X = [a,a,b,b,c,c,c,c,d,d]

dupli([], []).
dupli([H|T], [H, H|R]) :- dupli(T, R).

%solucion de la pagina
% P14 (*): Duplicate the elements of a list

% dupli(L1,L2) :- L2 is obtained from L1 by duplicating all elements.
%    (list,list) (?,?)

%dupli([],[]).
%dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).
