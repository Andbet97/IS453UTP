%http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/
%P20 (*) Remove the K'th element from a list.
%        Example:
%        ?- remove_at(X,[a,b,c,d],2,R).
%        X = b
%        R = [a,c,d]

addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

my_append([],  B, B).
my_append([H|T], L, [H|TR]) :- my_append(T, L, TR).

remove_at(A, B, C) :- removek1(A, B, [], C).
removek1([_|T], 1, A, R) :- my_append(A, T, R).
removek1([H|T], K, A, R) :-
    NK is K-1,
    addlast(A, H, NA),
    removek1(T, NK, NA, R).
