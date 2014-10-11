par(X) :- X mod 2 =:= 0.

elm([],[]).
elm([H|T],[H|RT]) :- par(H), elm(T,RT).
elm([H|T],RT) :- elm(T,RT).


/* Modo de uso: elm([1,2,3,4,5,6,7,8], Lst). */

/* Debe retornar Lst = [2,4,6,8]*/