%P22 (*) Create a list containing all integers within a given range.
%        Example:
%        ?- range(4,9,L).
%        L = [4,5,6,7,8,9]

range(A, A, [A]).
range(D, H, [D|L]) :- D < H, ND is D+1, range(ND, H, L).

%solucion pagina
% P22 (*):  Create a list containing all integers within a given range.

% range(I,K,L) :- I <= K, and L is the list containing all
%    consecutive integers from I to K.
%    (integer,integer,list) (+,+,?)

%range(I,I,[I]).
%range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).
