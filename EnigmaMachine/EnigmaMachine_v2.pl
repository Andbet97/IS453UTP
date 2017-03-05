%Enigma Machine version 2.
%Se reutiliza la base de conociiento de la version 1.
%En esta ocasion se tendra en cuenta las letras en gris
%(esto quiere decir que las reglas de estas se tienen en cuenta)
%de los rotores, ademas se recibira una lista con el orden en
%el cual  se quiere tener los rotores y cual rotor desea en
%estas posiciones, en esta lista en su posicion final se escoge
%tambien el reflector.

%saber la posicion de un elemento en la lista
%la pregunta es -?member(Lista, elemento, P).
member2([X], X, Acc, Acc).
member2([X|_], X, Acc, Acc).
member2([H|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P).
member(L, X, P) :- member2(L, X, 0, P).

%añadir al final de la lista
addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

%copiar una lista
copy([], A, A).
copy([H|T], A, L) :- addlast(A, H, NL), copy(T, NL, L).

%rotores
r_1([e, k, m, f, l, g, d, q, v, z, n, t, o, w, y, h, x, u,
       s, p, a, i, b, r, c, j]).
r_2([a, j, d, k, s, i, r, u, x, b, l, h, w, t, m, c, q, g,
       z, n, p, y, f, v, o, e]).
r_3([b, d, f, h, j, l, c, p, r, t, x, v, z, n, y, e, i, w,
       g, a, k, m, u, s, q, o]).
r_4([]).
r_5([]).
rf_a([]).
rf_b([y, r, u, h, q, s, l, d, p, x, n, g, o, k, m, i, e, b,
        f, z, c, w, v, j, a, t]).
rf_c([]).
alphabet([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
        q, r, s, t, u, v, w, x, y, z]).

%"rotar" una lista
rot(L, 0, L).
rot([H|T], 1, R) :- addlast(T, H, R).
rot([H|T], Acc, R):- Acc > 1, addlast(T, H, NL), NAcc is Acc-1,
      rot(NL, NAcc, R).

%obtener cabeza y cola de la lista
head_tail([H|T], H, T).

%crear un par
par(H, T, [H|T]).

%me da el elemento en la posicion N
give_elem([H|_], 0, H).
give_elem([_|T], P, R) :- P > 0, NP is P-1, give_elem(T, NP, R).

%escoger el rotor adecuado con su bandera.
choose_rot(E, R, B) :- (E = rotor1, r_1(R), B = q);
                       (E = rotor2, r_2(R), B = e);
                       (E = rotor3, r_3(R), B = v);
                       (E = rotor4, r_4(R), B = j);
                       (E = rotor5, r_5(R), B = z).

%escoger el reflector.
choose_rf(E, RF) :- (E = a, rf_a(RF));
                    (E = b, rf_b(RF));
                    (E = c, rf_c(RF)).

%aplicacion de las reglas de casillas grices
gray_bar(LRD, LRM, LRI, BD, BM, BI, NLD, NLM, NLI) :-
         .

%encriptar, desencriptar mensaje
solver([], _, _, _, _, S, _, _, _, S).
solver(M, LRD, LRM, LRI, RF, S, BD, BM, BI, E) :-
       head_tail(M, H, T),
%step1
       head_tail(LRD, RD, ARD), head_tail(LRM, RM, ARM),
       head_tail(LRI, RI, ARI), alphabet(AL),
       member(AL, H, P1), give_elem(RD, P1, L1),
       member(ARD, L1, P2), give_elem(RM, P2, L2),
       member(ARM, L2, P3), give_elem(RI, P3, L3),
       member(ARI, L3, P_F), give_elem(RF, P_F, X),
       member(AL, X, PF), give_elem(ARI, PF, B),
%step2
       member(RI, B, V1), give_elem(ARM, V1, B1),
       member(RM, B1, V2), give_elem(ARD, V2, B2),
       member(RD, B2, V3), give_elem(AL, V3, EI),
%step3
       addlast(S, EI, NS),
       gray_bar(LRD, LRM, LRI, BD, BM, BI, NLD, NLM, NLI),
       solver(T, NLD, NLM, NLI, RF, NS, BD, BM, BI, E).

%para encriptar
encrypt(M, C, LR, E) :-
    head_tail(C, N1, H1), head_tail(H1, N2, H2),
    head_tail(H2, N3, _),
    alphabet(L),
    member(L, N1, P1), member(L, N2, P2), member(L, N3, P3),
    head_tail(LR, R1, T1), head_tail(T1, R2, T2),
    head_tail(T2, R3, T3), head_tail(T3, R4, _),
    choose_rot(R1, RI, BI), choose_rot(R2, RM, BM),
    choose_rot(R3, RD, BD), choose_rf(R4, RF),
    alphabet(ARD), alphabet(ARI), alphabet(ARM),
    rot(RI, P1, S1), rot(ARI, P1, AS1), par(S1, AS1, LRI),
    rot(RM, P2, S2), rot(ARM, P2, AS2), par(S2, AS2, LRM),
    rot(RD, P3, S3), rot(ARD, P3, AS3), par(S3, AS3, LRD),
    solver(M, LRD, LRM, LRI, RF, [], BD, BM, BI, E).

%para desencriptar
decrypt(M, C, E) :- encrypt(M, C, E).
