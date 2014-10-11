program callToC;

Var x:Integer; external name 'y';

procedure inc_x; external name 'inc_y';

begin {programa principal}
	x:=1;
	inc_x;
	writeln('x=',x)
end.