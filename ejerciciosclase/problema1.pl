%me devuelve si dos listas son del mismo tamaño.
longer([], []).
longer([_|T], [_|T2]) :- longer(T, T2).
