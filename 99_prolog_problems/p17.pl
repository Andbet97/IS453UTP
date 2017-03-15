%P17 (*) Split a list into two parts; the length of the first part is given.
%        Do not use any predefined predicates.

%        Example:
%        ?- split([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
%        L1 = [a,b,c]
%        L2 = [d,e,f,g,h,i,k]

split([],_,[],[]).
split([H|T], A, L1, L2) :- splitux([H|T], A, 1, L1, L2).

splitux([H|T], A, A, [H], T).
splitux([H|T], A, N, [H|L1], L2) :- NN is N + 1, splitux(T, A, NN, L1, L2).

%solucion pagina
% P17 (*): Split a list into two parts

% split(L,N,L1,L2) :- the list L1 contains the first N elements
%    of the list L, the list L2 contains the remaining elements.
%    (list,integer,list,list) (?,+,?,?)

%split(L,0,[],L).
%split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).
