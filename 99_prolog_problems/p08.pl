%P08 (**) Eliminate consecutive duplicates of list elements.
%         If a list contains repeated elements they should be replaced with
%         a single copy of the element. The order of the elements should
%         not be changed.

%         Example:
%         ?- compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%         X = [a,b,c,a,d,e]

rev([], []).
rev([H|T], R) :- rev(T, NR), append(NR, [H], R).

compress([], []).
compress([H|T], R) :- comp(T, [H], NR), rev(NR, R).
comp([H|T], [H2|T2], R) :- H \= H2, append([H], [H2|T2], NT), comp(T, NT, R).
comp([H|T], [H|T2], R) :- comp(T, [H|T2], R).
comp([], S, S).

%solucion de la pagina
%compress([],[]).
%compress([X],[X]).
%compress([X,X|Xs],Zs) :- compress([X|Xs],Zs).
%compress([X,Y|Ys],[X|Zs]) :- X \= Y, compress([Y|Ys],Zs).
