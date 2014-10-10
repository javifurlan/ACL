Program tokenRecognizerej5;

{This program check if expressions stored in a file satisfy the following EBNF(Extended Backus Naur Form) rules:
  
  E --> T['+'E]
  T --> F['*'T]
  F --> V | '('E')'
  V --> ('0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9')+
}

Uses
  crt;
Var
  evaluation : Boolean;
  line : String;
  expresions : text;

function E(Var currentString : String) : boolean; forward;

function V(Var currentString : String) : boolean ; 
var
  i: Integer;
  actual:Char;
  itsOk:Boolean;
begin
  itsOk:=true;
  if (Length(currentString)=0) then
    itsOk:=false
  else begin
    i:=1;
    while (i<=Length(currentString)) AND itsOk do begin
      actual:=currentString[i];
      if ((actual<'0') OR (actual>'9')) then
        itsOk:=false;
      i:=i+1;
    end;
    V:=itsOk;
  end;
end;

function F(Var currentString : String) : boolean;
var
  aux: String;
begin
    if length(currentString)>2 then begin
    { currentString es de la forma '('..')' }
    if ((currentString[1]='(') and (currentString[length(currentString)]=')')) then begin 
    {copy(Cadena, Inicio, Cantidad)}
      aux := copy(currentString,2,length(currentString)-2);
      F:=E(aux);
    end else begin
      F:=V(currentString);
    end;
  end else begin
    F:= V(currentString) ;
  end;
end;

Function T (Var currentString : String) : Boolean;
Var
  symbol_founded : Boolean;
  i : Integer;
  aux : String;
Begin

  if (F(currentString)) then begin
    T:=true;
  end 
  else begin
    aux:='';
    i:=1;
    symbol_founded:=false;
    //Busca el simbolo * en currentString
    while ((i<Length(currentString)) and (not symbol_founded)) do begin
      if (currentString[i]='*') then begin
        symbol_founded:=true;
      end 
      else begin
        aux:=aux+currentString[i];
      end;
      i:=i+1;
    end;
    //Check that the part before '*' satisfies F and the part after '*' satisfies T
    if (symbol_founded and F(aux)) then begin
      aux := copy(currentString,i,Length(currentString)-i+1);
      T:=T(aux);
    end 
    else begin
      T:=false;
    end;

  end;
End;

Function E (Var currentString : String) : Boolean;
Var
  symbol_founded : Boolean;
  i : Integer;
  aux : String;
Begin
  
  if T(currentString) then begin
    E:=true;
  end else begin
    aux:='';
    i:=1;
    symbol_founded:=false;
    //Search the symbol '+' in the currentString
    while ((i<Length(currentString)) and (not symbol_founded)) do begin
      if (currentString[i]='+') then begin
        symbol_founded:=true;
      end else begin
        aux:=aux+currentString[i];
      end;
      i:=i+1;
    end;
    //Check that the part before '+' satisfies T and the part after '+' satisfies E
    if (symbol_founded and T(aux)) then begin
      aux := copy(currentString,i,Length(currentString)-i+1);
      E:=E(aux);
    end else begin
      E:=false;
    end;
  end;
End;

{INICIO PROGRAMA PRINCIPAL}
Begin
  if paramCount <> 1 then begin
    writeln('Error. Numero de parametros incorrecto');
    Halt;
  end;

  {$I-}
  assign(expresions,ParamStr(1));
  reset(expresions);
  {$I+}

  if IOResult<>0 then begin
    Writeln('Error abriendo '+ ParamStr(1));
    Halt;
  end;

  repeat
    readln(expresions,line);
    evaluation := E(line);
    writeln(line+' : ',evaluation);
  until eof(expresions);
End.{FIN}
