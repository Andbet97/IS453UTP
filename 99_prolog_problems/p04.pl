%P04 (*) Find the number of elements of a list.

number_elements(T, R) :- number(T, 0, R).
number([], A, A).
number([_|T], A, R) :- NA is A+1, number(T, NA, R).
