%P16 (**) Drop every N'th element from a list.
%         Example:
%         ?- drop([a,b,c,d,e,f,g,h,i,k],3,X).
%         X = [a,b,d,e,g,h,k]

drop([], _, []).
drop(_, 1, []).
drop(T, N, R) :- dropux(T, N, 1, R).

dropux([], _, _, []).
dropux([_|T], A, A, R) :- dropux(T, A, 1, R).
dropux([H|T], N, A, [H|R]) :- NA is A + 1, dropux(T, N, NA, R).

%solucion pagina
% P16 (**):  Drop every N'th element from a list

% drop(L1,N,L2) :- L2 is obtained from L1 by dropping every N'th element.
%    (list,integer,list) (?,+,?)

%drop(L1,N,L2) :- drop(L1,N,L2,N).

% drop(L1,N,L2,K) :- L2 is obtained from L1 by first copying K-1 elements
%    and then dropping an element and, from then on, dropping every
%    N'th element.
%    (list,integer,list,integer) (?,+,?,+)

%drop([],_,[],_).
%drop([_|Xs],N,Ys,1) :- drop(Xs,N,Ys,N).
%drop([X|Xs],N,[X|Ys],K) :- K > 1, K1 is K - 1, drop(Xs,N,Ys,K1).
