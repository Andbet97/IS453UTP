%P12 (**) Decode a run-length encoded list.
%         Given a run-length code list generated as specified in problem P11.
%         Construct its uncompressed version.

decode([], []).
decode([[1, V]|T], [V|R]) :- decode(T, R).
decode([[A, V]|T], [V|R]) :- A > 1, NA is A-1, decode([[NA, V]|T], R).
decode([H|T], [H|R]) :- decode(T, R).

%solucion pagina
% P12 (**): Decode a run-length compressed list.

% decode(L1,L2) :- L2 is the uncompressed version of the run-length
%    encoded list L1.
%    (list,list) (+,?)

%decode([],[]).
%decode([X|Ys],[X|Zs]) :- \+ is_list(X), decode(Ys,Zs).
%decode([[1,X]|Ys],[X|Zs]) :- decode(Ys,Zs).
%decode([[N,X]|Ys],[X|Zs]) :- N > 1, N1 is N - 1, decode([[N1,X]|Ys],Zs).
