{PROGRAMA QUE DEMUESTRA QUE PASCAL TIENE EQUIVALENCIA DE TIPOS POR NOMBRE}
program ej6;

type
	A = record
		i : Integer;
		j : Integer;
	end;

	B = record
		k : Integer;
		l : Integer;
	end;

var
	h: A;
	g: B;

begin
	g.k:=2;
	h:=g;
end.
