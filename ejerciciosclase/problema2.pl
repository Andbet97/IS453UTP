%me devuelve el sucesor de una lista que solo contiene 'a'.
succ(R, [a|R]).
succ([H|T], [H|T2]) :- succ(T, T2).
