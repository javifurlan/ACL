concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).

invertir([X],[X]).
invertir([X|M],Z):-invertir(M,S), concatenar(S,[X],Z).

long([],0):-!.
long([X|Y],S):-long(Y,T), S is T + 1.