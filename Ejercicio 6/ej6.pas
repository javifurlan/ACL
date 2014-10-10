  Program ej6;
  {SOLO FUNCIONA PARA OPERACIONES CON DOS OPERANDOS.. ARREGLARRRRRRRR}
  Uses pilas, sysutils, pilasChar;

  Const
  STACK_SIZE = 100;

  Var
  valueStack : Array[1..STACK_SIZE] of Integer;
  operatorStack : Array[1..STACK_SIZE] of Char; 
  topPointerValue, topPointerOperator : Integer;
  chr : Char;
  num : Integer;
  expresion : String;


  {Returns True iff param1 has precedence over param2}
  function priority(param1 : Char ; param2 : Char): Boolean;

  begin
    if ((param1='+') AND (param2='*')) then
      priority:=true
    else
      priority:=false
  end;

  function resolve(v1 : Integer; v2 : Integer; op : Char) : Integer;
  begin
    if(op = '+') then begin
      resolve:=(v1+v2)
    end;
    if(op = '*') then begin
      resolve:=(v1*v2)
    end
  end;

  function getNumber(str : String): String;
  var
    i: Integer;
    num : String;
  begin
    i:=0;
    num:='';
    while ((str[i] <> '+') AND (str[i] <> '*') AND (i<Length(str))) do begin
      num:=num+str[i];
      i:=i+1;
    end;
    getNumber:=num;
  end;

  procedure calculate();
  var 
    topeOperator: Char;
    value1, value2, res : Integer;
  begin
    {POP THE OPERATOR FROM THE OPERATOR STACK}
    topeOperator:=PopChar(operatorStack,topPointerOperator);
    {POP THE VALUE STACK (ONCE)}
    value1:=Pop(valueStack,topPointerValue);
    {POP THE VALUE STACK (TWICE)}
    value2:=Pop(valueStack,topPointerValue);
    {APPLY THE OPERATOR TO THE OPERANDS, IN THE CORRECT ORDER}
    res:=resolve(value1,value2,topeOperator);
    {PUSH THE RESULT ON TO THE VALUE STACK}
    Push(valueStack,res,topPointerValue);
  end;

  procedure evaluateExpression( str : String);
    var
    topeOperator : Char;
    current : String;
      i: Integer;
    begin
      i:=-1;
      {WHILE THERE ARE STILL TOKENS TO BE READ IN}
      while (i<Length(str)) do begin
        current:='';
        i:=i+(Length(current)+1);
        {GET THE NEXT TOKEN}
        chr:=str[i];
        {IF THE TOKEN IS A NUMBER}
        if ((ord(chr)-48 > -1) AND (ord(chr)-48 < 10)) then begin
          current:='';
          {WE READ THE ENTIRE NUMBER}
          while((chr <> '+') AND (chr <> '*')) do begin
            current:=current+str[i];
            i:=i+1;
            chr:=str[i];
          end;
          num:=strToInt(current);
          {PUSH IT ONTO THE VALUE STACK}
          push(valueStack,num,topPointerValue)
        end;
        {IF THE TOKEN IS A LEFT PARENTHESIS}
        if (chr = '(') then begin
          {PUSH IT ONTO THE OPERATOR STACK}
          pushChar(operatorStack,chr,topPointerOperator)
        end;
        {IF THE TOKEN IS A RIGHT PARENTHESIS}
        if (chr = ')') then begin
          topeOperator:=PopChar(operatorStack,topPointerOperator);
          {WHILE THE THING ON TOP OF THE OPERATOR STACK IS NOT A LEFT PARENTHESIS}
          while (topeOperator <> '(') do
          begin
            calculate
          end;
          writeln('En el tope de la pila quedo : ',TopChar(operatorStack,topPointerOperator));
          PopChar(operatorStack,topPointerOperator)
        end;
        {IF THE TOKEN IS AN OPERATOR}
        if ((chr = '+') OR (chr = '*')) then begin
          if (not isEmptyChar(topPointerOperator))then begin
            writeln('Passes through here in operators IF');
            topeOperator:=PopChar(operatorStack,topPointerOperator);
            writeln('El operador del tope de la pila de operadores es: ',topeOperator)
          end;
          {WHILE THE OPERATOR STACK IS NOT EMPTY, AND THE TOP THING ON THE OPERATOR STACK HAS THE SAME OR GREATER PRECEDENCE AS thisOp}
          while (not isEmptyChar(topPointerOperator)) AND (priority(topeOperator,chr)) do begin
            writeln('El operador del tope de la pila de operadores es: ',topeOperator,' y el operador que tengo en char');
            calculate
          end;
          {PUSH thisOp ON TO THE OPERATOR STACK}
          pushChar(operatorStack,chr,topPointerOperator);
        end;
      end;
      {WHILE THE OPERATOR STACK IS NOT EMPTY}
      while (not isEmptyChar(topPointerOperator)) do begin
        calculate       
      end;      
      writeln('El resultado es: ', Pop(valueStack,topPointerValue))
    end;

{PROGRAMA PRINCIPAL}
begin
  cleanStack(valueStack,topPointerValue);
  cleanStackChar(operatorStack,topPointerOperator);
  expresion:='12*1000+7';
  evaluateExpression(expresion);
end.