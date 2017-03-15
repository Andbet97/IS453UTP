%P18 (**) Extract a slice from a list.
%         Given two indices, I and K, the slice is the list containing the
%         elements between the I'th and K'th element of the original list
%         (both limits included). Start counting the elements with 1.

%         Example:
%         ?- slice([a,b,c,d,e,f,g,h,i,k],3,7,L).
%         X = [c,d,e,f,g]

slice([], _, _, []).
slice([_|T], D, G, R) :- D > 1, ND is D-1,
    NG is G-1,
    slice(T, ND, NG, R).
slice([H|T], 1, G, [H|T2]) :- G > 0, NG is G-1,
    slice(T, 1, NG, T2).
slice(_, 1, 0, R) :- slice([], _, _, R).

%solucion pagina
% P18 (**):  Extract a slice from a list

% slice(L1,I,K,L2) :- L2 is the list of the elements of L1 between
%    index I and index K (both included).
%    (list,integer,integer,list) (?,+,+,?)

%slice([X|_],1,1,[X]).
%slice([X|Xs],1,K,[X|Ys]) :- K > 1,
%   K1 is K - 1, slice(Xs,1,K1,Ys).
%slice([_|Xs],I,K,Ys) :- I > 1,
%   I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).
