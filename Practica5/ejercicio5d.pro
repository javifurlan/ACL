inserta(X,[X|H]) :- !.
inserta(X,[R|H],[X|Z]) :- inserta(X,H,Z).