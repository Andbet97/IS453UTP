%Ejemplo realizado en la primer semana de clase
%Hechos
woman(mia).
woman(jody).
woman(yolanda).
happy(yolanda).
happy(vincent).
listenMusic(mia).
listenMusic(butch).
playguitar(jody).
loves(marsellus, mia).
loves(vincent, mia).
loves(pumpkin, honney_bunny).
loves(honney_bunny, pumpkin).
party.

%Reglas
listenMusic(yolanda) :- happy(yolanda).
playguitar(mia) :- listenMusic(mia).
playguitar(yolanda) :- listenMusic(yolanda).
playguitar(vincent) :- listenMusic(vincent), happy(vincent).
playguitar(butch) :- happy(butch).
playguitar(butch) :- listenMusic(butch).
truelove(X, Y) :- loves(X, Y), loves(Y, X).
jealos(X, Y) :- loves(X, Z), loves(Y, Z).
