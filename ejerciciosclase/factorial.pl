factorial(0, 1) :- true, !.
factorial(X, Y) :- NX is X-1, factorial(NX, Z), Y is Z*X.
