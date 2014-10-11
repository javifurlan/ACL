{PROGRAMA QUE DEMUESTRA QUE PASCAL VIOLA EL PRINCIPIO DE COMPLETITUD DE TIPOS}
{EJ: RECORDS EN PASCAL NO PERMITEN DECLARAR FUNCIONES COMO CAMPOS}
{EJ: VER SI SE PUEDE RETORNAR CUALQUIER COSA EN UNA FUNCION}
{EJ: VER SI SE PUEDE RETORNAR CONSTANTES EN UNA FUNCION}
program ej8;
const
	max = 100;

function example(x : Integer): Integer;
begin
	example:=4;
end;

type
	A = record 
		i : Integer;
	end;

var
	arr: array[1..max] of Char;

{UNA FUNCION NO PERMITE RETORNAR ELEMENTOS DE CUALQUIER TIPO}
{function example(x : Integer): array of Char;
begin
	example:=a;
end;
}

{UNA FUNCION NO PERMITE RETORNAR ELEMENTOS DE CUALQUIER TIPO}
{function example(x : Integer): A;
type
	A = record 
		i : Integer;
	end;
begin
	A.i:=5;
	example:=A;
end;}

{function example2(): max;
begin
	example2:=max;
end;}

begin
	
end.
