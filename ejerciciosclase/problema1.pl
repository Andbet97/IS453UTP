%me devuelve si la lista de la derecha es mas larga.
longer([_|_], []).
longer([_|T], [_|T2]) :- longer(T, T2).
