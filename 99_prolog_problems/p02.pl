%P02 (*) Find the last but one element of a list.
%        (zweitletztes Element, l'avant-dernier élément).
%el penultimo elemento d ela lista.

last(X,[X,_]).
last(X,[_,Y|Ys]) :- last(X,[Y|Ys]).
