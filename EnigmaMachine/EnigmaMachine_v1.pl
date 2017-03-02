%Enigma Machine version 1.
%Esta es la maquina enigma en su versión básica.
%La distribución es: Reflector B, Rotor III, Rotor II, Rotor I.

%saber la posicion de un elemento en la lista
%la pregunta es -?member(Lista, elemento, P).
member2([[X|_]], X, Acc, Acc).
member2([[X|_]|_], X, Acc, Acc).
member2([[H|_]|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P).
member(L, X, P) :- member2(L, X, 1, P).

%a�adir al final de la lista
addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

%rotores
rotor1([[a, 3], [b, 1], [c, 2], [d, 4]]).
rotor2([[a, 3], [c, 1], [b, 2], [d, 4]]).
letras([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
        q, r, s, t, u, v, w, x, y, z]).

%rotar una lista
rotar([H|T], 1, R) :- addlast(T, H, R).
rotar([H|T], Acc, R):- Acc > 1, addlast(T, H, NL), NAcc is Acc-1,
      rotar(NL, NAcc, R).
rotar([H|T], Acc, R):- Acc < 1, A is 4+Acc, addlast(T, H, NL), NAcc is A-1,
      rotar(NL, NAcc, R).


%obtener cabeza de la lista
cabezaycola([H|T], H, T).

%para encriptar
%encrypt(M, C, E):- cabezaycola(C, N1, R1), cabezaycola(R1, N2, R2),
%    cabezaycola(R2, N3, _), letras(L), member(L, N1, P1),
%    member(L, N2, P2), member(L, N3, P3),
