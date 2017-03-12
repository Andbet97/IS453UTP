%multiplicacion de listas
succ(R, [a|R]).

sum(D, [], D).
sum(D, [_|T2], R) :- succ(D, N), sum(N, T2, R).

multiplicacion(_, [], []).
multiplicacion(D, T, R) :- mult(D, [], T, R).
mult(D, Acc, [_], R) :- sum(Acc, D, R).
mult(D, Acc, [_|T], R) :- sum(Acc, D, ND), mult(D, ND, T, R).
