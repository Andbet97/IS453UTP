%cabeza de la lista
heap([H|_], H).

%saber si un elemento pertenece a la lista
membership([], _) :- false.
membership([E|_], E) :- true,!.
membership([X|Y], E) :- E\=X, membership(Y, E).

%saber si dos listas son iguales
samelist([], []).
samelist([H|T1], [H|T2]) :- same(T1, T2).

%comprobar si los N primeros elementos son iguales
%la pregunta es -?samelistN(lista1, lista2, N).
samelistN([], [], 0).
samelistN([H|_], [H|_], 1).
samelistN([H|T], [H|T2], N) :-
    NN is N-1,
    samelistN(T, T2, NN).

%saber la posicion de un elemento en la lista
%la pregunta es -?member(Lista, elemento, P).
member2([X], X, Acc, Acc).
member2([X|_], X, Acc, Acc).
member2([H|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P).
member(L, X, P) :- member2(L, X, 1, P).

%obtener el último elemento de la lista.
my_last(X,[X]) :- !.
my_last(X, [_|T]) :- my_last(X, T).

%función que añade un valor a la lista
addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

%revertir una lista (dar vuelta)
my_reverse([], []).
my_reverse([H|T], L) :- my_reverse(T, R), addlast(R, H, L).

%Funcion que conatena listas
my_append([], B, B).
my_append([H|T], L, [H|TR]) :- my_append(T, L, TR).

%funcion para remover una posicion de la lista
removek(L, K, R) :- removek1(L, K, [], R).
removek1([_|T], 1, A, R) :- my_append(A, T, R).
removek1([H|T], K, A, R) :-
    NK is K-1,
    addlast(A, H, NA),
    removek1(T, NK, NA, R).
