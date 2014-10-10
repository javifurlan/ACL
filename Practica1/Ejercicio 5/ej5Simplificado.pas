{
SOLO RECONOCE FRASES SEGUN LA SIGUIENTE EBNF: 
  E -> V((+|*) E)*
  V -> ('0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9')+    
}
Program ej1Bis;
Uses pilas, sysutils;
{
PARA QUE RECONZCA FRASES SEGUN LA SIGUIENTE EBNF HAY QUE IMPLEMENTAR CADA UNA DE LAS REGLAS DECSRITAS EN LA MISMA:

  E -> T['+'E]
  T -> F['*'T]
  F -> V | '('E')'
  V -> ('0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9')+
}

{CHR(48) == 0 ; CHR(57) == 9 ; CHR(42) == * ; CHR(43) == +}
Const
  STACK_SIZE = 100;

Var 
  S : String; {VARIABLE GLOBAL EN LA CUAL ALMACENO UNA LINEA DEL ARCHIVO}
  C : char; {VARIABLE GLOBAL EN LA CUAL SE ALMACENAN LOS CARACTERES LEIDOS DESDE EL .TXT}
  F : Text; {VARIABLE GLOBAL UTILIZADA PARA CARGAR EL ARCHIVO DE TEXTO}
  itsOk : boolean; {VARIABLE GLOBAL QUE NOS DICE SI UNA EXPRESION ESTA BIEN ESCRITA O NO}
  i : Integer; {VARIABLE GLOBAL PARA IR LLEVANDO EL NUMERO DE EXPRESION ANALIZADA}

  {PROCEDIMIENTO QUE OBTIENE EL PRÓXIMO (SÍMBOLO) TOKEN DE LA ENTRADA}
  procedure next_token;
  begin
    Read(F,C); {LEO EL SIGUIENTE CARACTER DESDE EL ARCHIVO}
     {SI NO ES NI UN NUMERO NI UN + Ó *, SIGO LEYENDO. (SOLO RECONOCE NUMEROS, Y LAS OPERACIONES DE SUMA Y PRODUCTO)}                  
     while (C <> chr(42)) AND (C <> chr(43)) AND (not Eof(F))  AND ((C < chr(48)) OR (C > chr(57))) do begin 
        Read(F,C);
      end;
  end;

  {PROCEDIMIENTO PARA FIJAR EL VALOR DE LA VARIABLE ITS'OK}
  procedure setStatus(status : boolean); 
  begin
    itsOk:=status;
  end;

  {PROCEDIMIENTO ENCARGADO DE ANALIZAR LA EXPRESION HASTA EL PRIMER SIMBOLO (+ Ó *)}
  {EJ: SI LA EXPRESION ES 2+7, FIRSTPART ANALIZA LA PARTE 2+}
  procedure firstPart(var status: boolean);
  begin
    next_token;
    if(C = chr(43)) OR (C = chr(42)) then begin 
      {UNA EXPRESION NO PUEDE COMENZAR CON + Ó *}
      setStatus(false);
      while(not Eoln(F)) do 
      {RECORRO HASTA EL FIN DE LINEA (TOTAL YA SE QUE LA EXPRESION ESTA MAL ESCRITA)}
        next_token;
    end
    else begin
      if(Eoln(F)) AND ((C < chr(48)) OR (C > chr(57))) then begin
      {SI ESTOY AL FINAL DE LA LINEA Y EL CARACTER ES UN + O UN *, LA EXPRESION NO ES CORRECTA}  
        setStatus(false);
      end
      else
        while not(Eoln(F)) AND (C <> chr(42)) AND (C <> chr(43)) do begin
        {SI NO ESTOY AL FINAL DE LA LINEA Y EL CARACTER NO ES NI UN + NI UN *, PROSIGO CON LA LECTURA DEL PROXIMO CARACTER}
            next_token
        end;
    end;
    if(Eoln(F) AND (C = chr(42)) OR (C = chr(43))) then
        {SI ESTOY AL FINAL}
          setStatus(false);
  end;

  {PROCEDIMIENTO ENCARGADO DE ANALIZAR LA/S PARTE/S LUEGO DE LA PRIMERA, HASTA QUE HAYA UN SALTO DE LINEA}
  {EJ: SI LA EXPRESION ES 2+8*7+35+9*4, NEXTPART ANALIZA 8*7+35+9*4}
  procedure nextPart( var status: boolean);
  begin
    if(Eoln(F)) then begin
      {COMO EL PROCEDIMIENTO firstPart LEE HASTA EL CARACTER DE OPERACION(+ Ó *), SI ESTOY AL FINAL DE LINEA, LA EXPRESIÓN ES INCORRECTA}
      setStatus(false);
    end
    else
      while (not Eoln(F)) do begin
      {SI NO ESTOY AL FINAL DE LA LINEA, LEO EL SIGUIENTE CARACTER}
        next_token;
        if((C = chr(42)) OR (C = chr(43))) then begin
          {SI EL CARACTER LEIDO ES * Ó +, ENTONCES COMENZAMOS EL PROCESO DE LEER LA PARTE SIGUIENTE DE VUELTA}
          {EJ: SI LA EXPRESION ES 2+8*6, nextPart LA PRIMERA VEZ SOLO LEE HASTA EL 8, LUEGO DEBO "COMENZAR DE VUELTA" DESDE EL *}
          nextPart(status);
        end
      end;
  end;

  {PROCEDIMIENTO QUE IMPRIME POR PANTALLA EL STATUS DE UNA EXPRESION (SI ES CORRECTA O NO)}
  procedure showStatus(status : boolean; i : Integer);
  begin
    if(status = true) then begin
      write('Expresión nº ',i,' = ');
      writeln('La expresíon es correcta');
    end
    else begin 
      write('Expresión nº ',i,' = ');
      writeln('La expresion es incorrecta');
    end
  end;

{CUERPO PRINCIPAL DEL ALGORITMO}
begin
  
  Assign (F,'prueba.txt'); 
  Reset (F); {ABRE EL ARCHIVO PARA LECTURA}
  i:=0; {CONTADOR PARA EL NUMERO DE EXPRESIONES CARGADAS EN EL ARCHIVO .TXT}
  while(not Eof(F)) do begin
    i := i+1;
    itsOk:=true; {ACTUALIZO EL VALOR DE itsOk}
    firstPart(itsOk);
    if(not Eoln(F) AND ((C < chr(47)) OR (C > chr(57))))  then begin
      {SI NO ESTOY AL FINAL DE LA LINEA, Y EL CARACTER NO ES UN NUMERO, ENTONCES LLAMO AL PROCEDIMIENTO nextPart}
      setStatus(true); {ACTUALIZO EL VALOR DE STATUS}
      nextPart(itsOk);
      showStatus(itsOk,i);
    end
    else
      showStatus(itsOk,i); {IMPRIMO LA CONDICION (CORRECTA O INCORRECTA) DE LA ULTIMA EXPRESION}
  end;
  Close(F); {CIERRO EL ARCHIVO}
end. {FIN}