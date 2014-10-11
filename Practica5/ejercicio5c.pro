rm(X,[],[]).
rm(X,(X:YS),YS).
rm(X,(Y:YS),(Y:ZS)) :- rm(X,YS,ZS), X\=Y.

ins(X,YS,ZS) :- rm(X,ZS,YS).