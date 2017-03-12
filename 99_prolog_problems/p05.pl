%P05 (*) Reverse a list.

rev([], []).
rev([H|T], R) :- rev(T, NR), append(NR, [H], R).
