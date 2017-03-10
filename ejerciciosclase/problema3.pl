%sumar listas de solo 'a'.
succ(R, [a|R]).

sum(D, [], D).
sum(D, [_|T2], R) :- succ(D, N), sum(N, T2, R).
