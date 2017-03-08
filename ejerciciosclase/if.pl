%version propia de un if

if(C, A, V, R) :- (C = a, R is 1, !); (A = b, R is 2, !);
    (V = c, R is 3, !).
