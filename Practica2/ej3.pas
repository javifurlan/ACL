{PROGRAM THAT DETERMINES THE NUMBER OF BITS OF THE INTEGERS IN PASCAL}
program ej3;
var
	i: Integer;


procedure mayorEntero;
begin
	for i:=0 to 32767 do
		writeln(i);
end;

begin
	mayorEntero;
	i:=(2*2*2*2*2*2*2*2*2*2*2*2*2*2*2)-1;
	writeln(i);
end.