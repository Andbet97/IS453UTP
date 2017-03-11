%P03 (*) Find the K'th element of a list.
%        The first element in the list is number 1.
%        Example:
%        ?- element_at(X,[a,b,c,d,e],3).
%        X = c

element_at(H, [H|_], 1).
element_at(X, [_|T], R) :- R > 1, NR is R-1, element_at(X, T, NR).
