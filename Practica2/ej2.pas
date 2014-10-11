{PROGRAMA QUE DEMUESTRA QUE PASCAL NO TIENE TRANSPARENCIA REFERENCIAL}
program ej2;

var
	x: Integer;
	y:Integer;

	aux: Integer;

procedure noRefTransparencial(var num : Integer);
begin
	y:=num+y;
end;

function f(var x : Integer): Integer;
begin
	x:=x+1;
	f:=x;
end;

begin
	x:=1;
	y:=2;
	noRefTransparencial(x);
	Writeln('El valor de y en la primer llamada es: ',y);
	noRefTransparencial(x);
	Writeln('El valor de y en la segunda llamada es: ',y);
end.