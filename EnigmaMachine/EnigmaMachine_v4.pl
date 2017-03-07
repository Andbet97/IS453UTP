%Enigma Machine version 4.
%Se reutiliza la base de conociiento de la version 3.
%En esta ocacion inclire "The Plug Board".

%saber la posicion de un elemento en la lista
%la pregunta es -?member(Lista, elemento, P).
member2([X], X, Acc, Acc) :- !.
member2([X|_], X, Acc, Acc) :- !.
member2([H|T], X, Acc, P) :-
    NAcc is Acc+1,
    X \= H,
    member2(T, X, NAcc, P), !.
member(L, X, P) :- member2(L, X, 0, P).

%a�adir al final de la lista
addlast([], E, [E]) :- !.
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL), !.

%copiar una lista
copy([], A, A) :- !.
copy([H|T], A, L) :- addlast(A, H, NL), copy(T, NL, L), !.

%rotores
r1([e, k, m, f, l, g, d, q, v, z, n, t, o, w, y, h, x, u,
    s, p, a, i, b, r, c, j]).
r2([a, j, d, k, s, i, r, u, x, b, l, h, w, t, m, c, q, g,
    z, n, p, y, f, v, o, e]).
r3([b, d, f, h, j, l, c, p, r, t, x, v, z, n, y, e, i, w,
    g, a, k, m, u, s, q, o]).
r4([e, s, o, v, p, z, j, a, y, q, u, i, r, h, x, l, n, f,
    t, g, k, d, c, m, w, b]).
r5([v, z, b, r, g, i, t, y, u, p, s, d, n, h, l, x, a, w,
    m, j, q, o, f, e, c, k]).
rfb([y, r, u, h, q, s, l, d, p, x, n, g, o, k, m, i, e, b,
     f, z, c, w, v, j, a, t]).
rfc([f, v, p, j, i, a, o, y, e, d, r, z, x, w, g, c, t, k,
     u, q, s, b, n, m, h, l]).
rng1(q).
rng2(e).
rng3(v).
rng4(z).
rng5(j).
alphabet([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
          q, r, s, t, u, v, w, x, y, z]).

%"rotar" una lista
rot(L, 0, L) :- !.
rot([H|T], 1, R) :- addlast(T, H, R), !.
rot([H|T], Acc, R):- Acc > 1, addlast(T, H, NL),
    NAcc is Acc-1, rot(NL, NAcc, R), !.

%obtener cabeza y cola de la lista
head_tail([H|T], H, T).

%crear un par
par(H, T, [H|T]).

%me da el elemento en la posicion N
give_elem([H|_], 0, H) :- !.
give_elem([_|T], P, R) :- P > 0, NP is P-1,
    give_elem(T, NP, R), !.

%escoger el rotor adecuado con su bandera.
choose_rot(E, R) :- (E = i, r1(R), !);
                    (E = ii, r2(R), !);
                    (E = iii, r3(R), !);
                    (E = iv, r4(R), !);
                    (E = v, r5(R), !).

%escoger el reflector.
choose_rf(E, RF) :- (E = b, rfb(RF), !);
                    (E = c, rfc(RF), !).

%escoger la bandera de los anillos.
choose_rng(E, B) :- (E = i, rng1(B), !);
                    (E = ii, rng2(B), !);
                    (E = iii, rng3(B), !);
                    (E = iv, rng4(B), !);
                    (E = v, rng5(B), !).

%aplicacion de las reglas de casillas grices
gray_bar(LRD, LRM, LRI, BD, BM, NLD, NLM, NLI) :-
    (
     head_tail(LRM, RM, ARM), head_tail(ARM, PB1, _),
     PB1 = BM,
     head_tail(LRD, RD, ARD), head_tail(LRI, RI, ARI),
     rot(RD, 1, NRD), rot(RM, 1, NRM), rot(RI, 1, NRI),
     rot(ARD, 1, AD), rot(ARM, 1, AM), rot(ARI, 1, AI),
     par(NRD, AD, NLD), par(NRM, AM, NLM), par(NRI, AI, NLI), !
    );
    (
     head_tail(LRD, RD, ARD), head_tail(ARD, PB2, _),
     PB2 = BD,
     head_tail(LRM, RM, ARM),
     rot(RD, 1, NRD), rot(ARD, 1, AD),
     rot(RM, 1, NRM), rot(ARM, 1, AM),
     par(NRD, AD, NLD), par(NRM, AM, NLM),
     copy(LRI, [], NLI), !
    );
    (
     head_tail(LRD, RD, ARD),
     rot(RD, 1, NRD), rot(ARD, 1, AD), par(NRD, AD, NLD),
     copy(LRM, [], NLM), copy(LRI, [], NLI), !
    ).
%obtener posicion para la reconfiguracion
sum(D, P, R) :- NR is D+P, (
                            (NR < 26, R is NR, !);
                            (NR > 25, NNR is NR-26, R is NNR, !)
                           ).

%resta en el alfabeto
rest(E, D, R) :- NR is E-D, (
                             (NR > -1, R is NR, !);
                             (NR < 0, NNR is 26+NR, R is NNR, !)
                            ).

%reconfiguracion de rotores
reconf_rot(PR, D, R) :- reconfig(PR, D, [], R).
reconfig(PR, 0, _, PR) :- !.
reconfig([], _, S, S).
reconfig([H|T], D, S, R) :- D > 0, alphabet(L), member(L, H, P),
    sum(D, P, F), give_elem(L, F, N), addlast(S, N, NS),
    reconfig(T, D, NS, R), !.

%encriptar, desencriptar mensaje
solver([], _, _, _, _, S, _, _, _, S).
solver(M, LRD, LRM, LRI, RF, S, BD, BM, L, E) :-
    head_tail(M, H, T),
%step1
    head_tail(LRD, RD, ARD), head_tail(LRM, RM, ARM),
    head_tail(LRI, RI, ARI), alphabet(AL),
    member(L, H, P1),
    give_elem(RD, P1, L1),
    member(ARD, L1, P2), give_elem(RM, P2, L2),
    member(ARM, L2, P3), give_elem(RI, P3, L3),
    member(ARI, L3, P_F), give_elem(RF, P_F, X),
    member(AL, X, PF), give_elem(ARI, PF, B),
%step2
    member(RI, B, V1), give_elem(ARM, V1, B1),
    member(RM, B1, V2), give_elem(ARD, V2, B2),
    member(RD, B2, V3), give_elem(L, V3, EI),
%step3
    addlast(S, EI, NS),
    gray_bar(LRD, LRM, LRI, BD, BM, NLRD, NLRM, NLRI),
    solver(T, NLRD, NLRM, NLRI, RF, NS, BD, BM, L, E).

%reemplazar la posicion N de una lista por un elemento dado
replace(S, P, E, NS) :- replace_aux(S, P, E, 25, [], NS), !.
replace_aux(_, _, _, -1, S, S).
replace_aux(S, P, E, C, PS, NS) :- PR is 25-C, head_tail(S, H, T),
    (
     (PR = P, addlast(PS, E, NPS));
     (PR \= P, addlast(PS, H, NPS))
    ), NC is C-1, replace_aux(T, P, E, NC, NPS, NS).


%obtener alfabeto con las parejas intercambiadas
alphabet_to_use([H|T], S, AL) :- head_tail(H, H1, T1), head_tail(T1, H2, _),
    member(S, H1, P1), member(S, H2, P2),
    replace(S, P1, H2, NS), replace(NS, P2, H1, NNS),
    alphabet_to_use(T, NNS, AL), !.
alphabet_to_use([], S, S) :- !.

%para encriptar
encrypt(M, RINGS, SETING, R, C, PAIRS, E) :-
    %configracion final
    head_tail(C, N1, C1), head_tail(C1, N2, C2),
    head_tail(C2, N3, _), alphabet(L),
    member(L, N1, P1), member(L, N2, P2), member(L, N3, P3),
    %anilos
    head_tail(RINGS, _, T_1), head_tail(T_1, RN2, T_2),
    head_tail(T_2, RN3, _),
    choose_rng(RN2, BM), choose_rng(RN3, BD),
    %escoger rotores
    head_tail(R, R1, T1), head_tail(T1, R2, T2),
    head_tail(T2, R3, T3), head_tail(T3, R4, _),
    choose_rot(R1, PRI), choose_rot(R2, PRM),
    choose_rot(R3, PRD), choose_rf(R4, RF),
    %reconfigracion de rotores con anillos
    head_tail(SETING, CONF1, G), head_tail(G, CONF2, G2),
    head_tail(G2, CONF3, _),
    NCF1 is CONF1-1, NCF2 is CONF2-1, NCF3 is CONF3-1,
    rot(L, NCF1, ARI), rot(L, NCF2, ARM), rot(L, NCF3, ARD),
    reconf_rot(PRI, NCF1, RI), reconf_rot(PRM, NCF2, RM),
    reconf_rot(PRD, NCF3, RD),
    %rotando a configuracion final
    rest(P1, NCF1, P1_1), rest(P2, NCF2, P2_2),
    rest(P3, NCF3, P3_3),
    NP3 is P3_3+1,
    rot(RI, P1_1, S1), rot(ARI, P1_1, AS1), par(S1, AS1, LRI),
    rot(RM, P2_2, S2), rot(ARM, P2_2, AS2), par(S2, AS2, LRM),
    rot(RD, NP3, S3), rot(ARD, NP3, AS3), par(S3, AS3, LRD),
    %obtener alfabeto con las parejas intercambiadas
    alphabet_to_use(PAIRS, L, AL),
    solver(M, LRD, LRM, LRI, RF, [], BD, BM, AL, E), !.

%para desencriptar
decrypt(M, RINGS, SETING, R, C, PAIRS, E) :-
    encrypt(M, RINGS, SETING, R, C, PAIRS,E).
