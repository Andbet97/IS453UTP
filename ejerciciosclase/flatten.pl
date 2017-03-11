%funcion de lista que me devuelve una lista aplanada.
flatten([], []).
flatten([H|T], R) :- flatten(H, FH), flatten(T, FT),
                     append(FH, FT, R).
flatten(X, [X]).
