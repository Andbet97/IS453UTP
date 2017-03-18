permute([], []).
permute(L, [H|P]) :- borrar(H, L, R), permute(R, P).

borrar(X, [X|T], T).
borrar(X, [H|T], [H|NT]) :- borrar(X, T, NT).

my_permutation(Bs, [A|As]):-
          append(Xs, [A|Ys], Bs),
          append(Xs, Ys, Zs),
          my_permutation(Zs, As).

my_permutation([], []).
