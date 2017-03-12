%P09 (**) Pack consecutive duplicates of list elements into sublists.
%         If a list contains repeated elements they should be placed in separate sublists.
%
%         Example:
%         ?- pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%         X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

rev([], []).
rev([H|T], R) :- rev(T, NR), append(NR, [H], R).

pack([], []).
pack([H|T], R) :- pack2(T, [[H]], NR), rev(NR, R).
pack2([H|T], [[H2|T1]|T2], R) :- H \= H2, append([[H]], [[H2|T1]|T2], NT),
                                 pack2(T, NT, R).
pack2([H|T], [[H|T1]|T2], R) :- append([H], [H|T1], NL), pack2(T, [NL|T2], R).
pack2([], S, S).

%solucion de la pagina
%pack([],[]).
%pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).

% transfer(X,Xs,Ys,Z) Ys is the list that remains from the list Xs
%    when all leading copies of X are removed and transfered to Z

%transfer(X,[],[],[X]).
%transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.
%transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).
