pertenece(X,[X|_]).
pertenece(X,[_|T]):-pertenece(X,T).