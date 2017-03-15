%P10 (*) Run-length encoding of a list.
%        Use the result of problem P09 to implement the so-called run-length
%        encoding data compression method. Consecutive duplicates of elements
%        are encoded as terms [N,E] where N is the number of duplicates of
%        the element E.

%        Example:
%        ?- encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%        X = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]

rev([], []).
rev([H|T], R) :- rev(T, NR), append(NR, [H], R).

encode([], []).
encode([H|T], R) :- encodeaux(T, [[1, H]], NR), rev(NR, R).
encodeaux([H|T], [[A, H2|T1]|T2], R) :- H \= H2, append([[1, H]], [[A, H2|T1]|T2], NT),
                                        encodeaux(T, NT, R).
encodeaux([H|T], [[A, H|T1]|T2], R) :- NA is A+1,
                                       encodeaux(T, [[NA, H|T1]|T2], R).
encodeaux([], S, S).


%solucion pagina
% P10 (*):  Run-length encoding of a list

% encode(L1,L2) :- the list L2 is obtained from the list L1 by run-length
%    encoding. Consecutive duplicates of elements are encoded as terms [N,E],
%    where N is the number of duplicates of the element E.
%    (list,list) (+,?)

%:- ensure_loaded(p09).

%encode(L1,L2) :- pack(L1,L), transform(L,L2).

%transform([],[]).
%transform([[X|Xs]|Ys],[[N,X]|Zs]) :- length([X|Xs],N), transform(Ys,Zs).
