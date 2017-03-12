%P07 (**) Flatten a nested list structure.
%         Transform a list, possibly holding lists as elements into a `flat´ list
%         by replacing each list with its elements (recursively).
%         Example:
%         ?- my_flatten([a, [b, [c, d], e]], X).
%         X = [a, b, c, d, e]

%         Hint: Use the predefined predicates is_list/1 and append/

my_flatten(L, R) :- aux(L, [], R).
aux([], S, S).
aux([H|T], S, R) :- is_list(H), aux(H, S, NR),
                    aux(T, NR, R).
aux([H|T], S, R) :- append(S, [H], NS), aux(T, NS, R).
