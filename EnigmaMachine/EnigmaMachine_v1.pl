%Enigma Machine version 1.
%Esta es la maquina enigma en su versión básica.
%La distribución es: Reflector B, Rotor III, Rotor II, Rotor I.

%saber la posicion de un elemento en la lista
%se modificara para saber la lista que tenga como cabeza el elemento a
%buscar la pregunta es -?member(Lista, elemento, P).
member2([[X|_]], X, Acc, Acc).
member2([[X|_]|_], X, Acc, Acc).
member2([[H|_]|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P).
member(L, X, P) :- member2(L, X, 1, P).


rotor1([[a, 3], [b, 1], [c, 2], [d, 4]]).
rotor2([[a, 3], [c, 1], [b, 2], [d, 4]]).

member1(R, X, P) :- R = rotor1, rotor1(NL), member(NL, X, P).
member1(R, X, P) :- R = rotor2, rotor2(NL), member(NL, X, P).

