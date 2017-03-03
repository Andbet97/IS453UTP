%Enigma Machine version 1.
%Esta es la maquina enigma en su versión básica.
%La distribución es: Reflector B, Rotor III, Rotor II, Rotor I.

%saber la posicion de un elemento en la lista
%la pregunta es -?member(Lista, elemento, P).
member2([X], X, Acc, Acc).
member2([X|_], X, Acc, Acc).
member2([H|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P).
member(L, X, P) :- member2(L, X, 0, P).

%a�adir al final de la lista
addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

%copiar una lista
copy([], A, A).
copy([H|T], A, L) :- addlast(A, H, NL), copy(T, NL, L).

%rotores
r1([e, k, m, f, l, g, d, q, v, z, n, t, o, w, y, h, x, u,
       s, p, a, i, b, r, c, j]).
r2([a, j, d, k, s, i, r, u, x, b, l, h, w, t, m, c, q, g,
       z, n, p, y, f, v, o, e]).
r3([b, d, f, h, j, l, c, p, r, t, x, v, z, n, y, e, i, w,
       g, a, k, m, u, s, q, o]).
rfb([y, r, u, h, q, s, l, d, p, x, n, g, o, k, m, i, e, b,
        f, z, c, w, v, j, a, t]).
alphabet([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
        q, r, s, t, u, v, w, x, y, z]).

%"rotar" una lista
rot(L, 0, L).
rot([H|T], 1, R) :- addlast(T, H, R).
rot([H|T], Acc, R):- Acc > 1, addlast(T, H, NL), NAcc is Acc-1,
      rot(NL, NAcc, R).

%obtener cabeza y cola de la lista
head_tail([H|T], H, T).

%me da el elemento en la posicion N
give_elem([H|_], 0, H).
give_elem([_|T], P, R) :- P > 0, NP is P-1, give_elem(T, NP, R).

%evalar si ya se rotaron todos los rotores
eval(C, NC, 2) :- C > 78, NC is 1, eval(NC, NC, 0).
eval(C, NC, 2) :- (C < 78; C = 78), NC is C, eval(NC, NC, 0).
eval(A, A, 0).

%rotar en orden los rotores
rot_one(RD, RM, RI, C, NRD, NRM, NRI) :- C < 26,
        copy(RI, [],NRI), copy(RM, [], NRM), rot(RD, 1, NRD).
rot_one(RD, RM, RI, C, NRD, NRM, NRI):- C = 26,
        copy(RI, [], NRI), rot(RM, 1, NRM), rot(RD, 1, NRD).
rot_one(RD, RM, RI, C, NRD, NRM, NRI):- (C > 26, C < 52),
        copy(RD, [], NRD), copy(RI, [], NRI), rot(RM, 1, NRM).
rot_one(RD, RM, RI, C, NRD, NRM, NRI):- C = 52,
        copy(RD, [], NRD), rot(RM, 1, NRM), rot(RI, 1, NRI).
rot_one(RD, RM, RI, C, NRD, NRM, NRI):- (C > 52, C < 78),
        copy(RD, [], NRD), copy(RM, [], NRM), rot(RI, 1, NRI).
rot_one(RD, RM, RI, C, NRD, NRM, NRI):- C = 78,
        copy(RM, [], NRM), rot(RI, 1, NRI), rot(RD, 1, NRD).

%encriptar, desencriptar mensaje
solver([], _, _, _, _, S, _, S).
solver(M, RD, RM, RI, RF, S, C, E) :- head_tail(M, H, T),
%step1
       alphabet(AL), member(AL, H, P1), give_elem(RD, P1, L1),
       member(AL, L1, P2), give_elem(RM, P2, L2),
       member(AL, L2, P3), give_elem(RI, P3, L3),
       member(AL, L3, PF), give_elem(RF, PF, B),
%step2
       member(RI, B, V1), give_elem(AL, V1, B1),
       member(RM, B1, V2), give_elem(AL, V2, B2),
       member(RD, B2, V3), give_elem(AL, V3, EI),
%step3
       addlast(S, EI, NS), NC is C+1, eval(NC, NAC, 2),
       rot_one(RD, RM, RI, NAC, NRD, NRM, NRI),
       print_message(warning, NRD),
       solver(T, NRD, NRM, NRI, RF, NS, NAC, E).


%para encriptar
encrypt(M, C, E) :- head_tail(C, N1, R1), head_tail(R1, N2, R2),
    head_tail(R2, N3, _), alphabet(L), member(L, N1, P1),
    member(L, N2, P2), member(L, N3, P3), r1(RI), r2(RM),
    r3(RD), rot(RI, P1, S1), rot(RM, P2, S2), rot(RD, P3, S3),
    rfb(RF), solver(M, S3, S2, S1, RF, [], 0, E).

%para desencriptar
decrypt(M, C, E) :- encrypt(M, C, E).
