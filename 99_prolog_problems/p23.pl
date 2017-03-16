%P23 (**) Extract a given number of randomly selected elements from a list.
%         The selected items shall be put into a result list.
%         Example:
%         ?- rnd_select([a,b,c,d,e,f,g,h],3,L).
%         L = [e,d,a]

%         Hint: Use the built-in random number generator random/2 and
%               the result of problem P20.

remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], B, [H|C]) :- B > 1, NB is B-1,remove_at(X, T, NB, C).

rnd_select(_, 0, []).
rnd_select(L, X, [NH|R]) :- X > 0, length(L, C), random(1, C, F),
                            remove_at(NH, L, F, NL), NX is X-1, rnd_select(NL, NX, R).

%solucion pagina
% P23 (**): Extract a given number of randomly selected elements
%    from a list.

% rnd_select(L,N,R) :- the list R contains N randomly selected
%    items taken from the list L.
%    (list,integer,list) (+,+,-)

%:- ensure_loaded(p20).

%rnd_select(_,0,[]).
%rnd_select(Xs,N,[X|Zs]) :- N > 0,
%    length(Xs,L),
%    I is random(L) + 1,
%    remove_at(X,Xs,I,Ys),
%    N1 is N - 1,
%    rnd_select(Ys,N1,Zs).
