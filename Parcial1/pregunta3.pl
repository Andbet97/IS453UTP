succ(R, [a|R]).

sum(D, [], D).
sum(D, [_|T2], R) :- succ(D, N), sum(N, T2, R).

multiplicacion(_, [], []).
multiplicacion(D, T, R) :- mult(D, [], T, R).
mult(D, Acc, [_], R) :- sum(Acc, D, R).
mult(D, Acc, [_|T], R) :- sum(Acc, D, ND), mult(D, ND, T, R).

pow([_|_], [], [a]).
pow(L, [a], L).
pow(L, E, R) :- powux(L, E, [], R).

powux(_, [_], A, A).
powux(L, [_|T], A, R) :- multiplicacion(L, L, NL), append(NL, A, NA),
                         powux(L, T, NA, R).
