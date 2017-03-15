%P11 (*) Modified run-length encoding.
%        Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

%        Example:
%        ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%        X = [[4,a],b,[2,c],[2,a],d,[4,e]]

rev([], []).
rev([H|T], R) :- rev(T, NR), append(NR, [H], R).

encode_modified([], []).
encode_modified([H|T], R) :- encodeaux(T, [[1, H]], NR), rev(NR, NNR), result(NNR, R).
encodeaux([H|T], [[A, H2|T1]|T2], R) :- H \= H2, append([[1, H]], [[A, H2|T1]|T2], NT),
                                        encodeaux(T, NT, R).
encodeaux([H|T], [[A, H|T1]|T2], R) :- NA is A+1,
                                       encodeaux(T, [[NA, H|T1]|T2], R).
encodeaux([], S, S).

result([], []).
result([[1, H|_]|T], [H|R]) :- result(T, R).
result([[H,T1]|T], [H|R]) :- H > 1, result(T, R).

%sulucion pagina
% P11 (*):  Modified run-length encoding

% encode_modified(L1,L2) :- the list L2 is obtained from the list L1 by
%    run-length encoding. Consecutive duplicates of elements are encoded
%    as terms [N,E], where N is the number of duplicates of the element E.
%    However, if N equals 1 then the element is simply copied into the
%    output list.
%    (list,list) (+,?)

%:- ensure_loaded(p10).

%encode_modified(L1,L2) :- encode(L1,L), strip(L,L2).
%strip([],[]).
%strip([[1,X]|Ys],[X|Zs]) :- strip(Ys,Zs).
%strip([[N,X]|Ys],[[N,X]|Zs]) :- N > 1, strip(Ys,Zs).
