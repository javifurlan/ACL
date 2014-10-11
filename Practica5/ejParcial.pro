es_par(X):- X mod 2 =:= 0.

elementos_pares([],[]).
elementos_pares([X|XS],[X|YS]):- es_par(X), elementos_pares(XS,YS).
elementos_pares([X|XS],YS):- elementos_pares(XS,YS).