%http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/
%P20 (*) Remove the K'th element from a list.
%        Example:
%        ?- remove_at(X,[a,b,c,d],2,R).
%        X = b
%        R = [a,c,d]

remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], B, [H|C]) :- B > 1, NB is B-1,remove_at(X, T, NB, C).

%solucion pagina
% P20 (*): Remove the K'th element from a list.
% The first element in the list is number 1.

% remove_at(X,L,K,R) :- X is the K'th element of the list L; R is the
%    list that remains when the K'th element is removed from L.
%    (element,list,integer,list) (?,?,+,?)

%remove_at(X,[X|Xs],1,Xs).
%remove_at(X,[Y|Xs],K,[Y|Ys]) :- K > 1,
%   K1 is K - 1, remove_at(X,Xs,K1,Ys).
