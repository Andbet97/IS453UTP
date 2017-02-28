%P06 (*) Find out whether a list is a palindrome.
%        A palindrome can be read forward or backward; e.g. [x,a,m,a,x].

same([], []).
same([H|T1], [H|T2]) :- same(T1, T2).

addlast([], E, [E]).
addlast([H|T], E, [H|TL]) :- addlast(T, E, TL).

my_reverse([], []).
my_reverse([H|T], L) :- my_reverse(T, R), addlast(R, H, L).

palindrome(L) :- my_reverse(L, R), same(L, R).
