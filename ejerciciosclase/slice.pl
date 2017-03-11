%me devuelve la lista desde una posicion hasta otra posicion
%ej: slice([1, 2 , 3, 4, 5], 2, 4, R).
%R = [2, 3, 4].
slice([], _, _, []).
slice([_|T], D, G, R) :- D > 1, ND is D-1,
    NG is G-1,
    slice(T, ND, NG, R).
slice([H|T], 1, G, [H|T2]) :- G > 0, NG is G-1,
    slice(T, 1, NG, T2).
slice(_, 1, 0, R) :- slice([], _, _, R).
