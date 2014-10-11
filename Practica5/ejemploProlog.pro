quiere_a(maria,enrique). 
quiere_a(juan,jorge). 
quiere_a(maria,susana). 
quiere_a(maria,ana). 
quiere_a(susana,pablo). 
quiere_a(ana,jorge). 
varon(juan). 
varon(pablo). 
varon(jorge). 
varon(enrique). 
hembra(maria). 
hembra(susana). 
hembra(ana). 
teme_a(susana,pablo). 
teme_a(jorge,enrique). 
teme_a(maria,pablo). 
/*  Esta linea es un comentario  */ 
quiere_pero_teme_a(X,Y) :- quiere_a(X,Y), teme_a(X,Y). 
querido_por(X,Y) :- quiere_a(Y,X). 
puede_casarse_con(X,Y) :- quiere_a(X,Y), varon(X), hembra(Y). 
puede_casarse_con(X,Y) :- quiere_a(X,Y), hembra(X), varon(Y).