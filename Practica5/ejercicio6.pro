/*
Ejercicio 6: es ineficiente debido a que cada vez que se deba hacer backtracking, se deben volver a computar los calculos ya realizados.
De la siguiente manera, se "incrementa" su eficiencia.
FALLA EN EL SIGUIENTE CASO: max(3,y,2). Para que no falle, se deberia agregar (ya agregado), que y=z.
max(x,y,y) :- x>=y,!, x=z, y=0.
max(x,y,x).
*/

max(x,y,x) :- x>=y,!, x=z.
max(x,y,y).