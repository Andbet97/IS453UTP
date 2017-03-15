%P15 (**) Duplicate the elements of a list a given number of times.
%         Example:
%         ?- dupli([a,b,c],3,X).
%         X = [a,a,a,b,b,b,c,c,c]

%         What are the results of the goal:
%         ?- dupli(X,3,Y).

dupli([], _,[]).
dupli(_, 0,[]).
dupli(T, 1, T).
dupli(T, A, R) :- A > 1, dupli2(T, A, 1, R), print(R).

dupli2([],_,_,[]).
dupli2([H|T], A, A, [H|R]) :- dupli2(T, A, 1, R).
dupli2([H|T], A, Acc, [H|R]) :- NAcc is Acc+1, dupli2([H|T], A, NAcc, R).

%solucion pagina
% P15 (**): Duplicate the elements of a list agiven number of times

% dupli(L1,N,L2) :- L2 is obtained from L1 by duplicating all elements
%    N times.
%    (list,integer,list) (?,+,?)

%dupli(L1,N,L2) :- dupli(L1,N,L2,N).

% dupli(L1,N,L2,K) :- L2 is obtained from L1 by duplicating its leading
%    element K times, all other elements N times.
%    (list,integer,list,integer) (?,+,?,+)

%dupli([],_,[],_).
%dupli([_|Xs],N,Ys,0) :- dupli(Xs,N,Ys,N).
%dupli([X|Xs],N,[X|Ys],K) :- K > 0, K1 is K - 1, dupli([X|Xs],N,Ys,K1).
