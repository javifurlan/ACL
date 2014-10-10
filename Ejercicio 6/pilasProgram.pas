program Pilas;

Const
    STACK_SIZE = 100;

Var 
  operands : Array[1..STACK_SIZE] of Integer;
  topPointerOperands : Integer; {TOPE DE LA PILA OPERANDS}
  operators : Array[1..STACK_SIZE] of Integer;
  topPointerOperators : Integer; {TOPE DE LA PILA OPERATORS}

Procedure InitStack (VAR topPointer : Integer);
Begin
 topPointer := 0;
End;

Function IsEmpty (topPointer : Integer): Boolean;
Begin
 IsEmpty := false;
 If (topPointer = 0) then
  IsEmpty := true;
End; 

Function IsFull (topPointer : Integer): Boolean;
Begin
 IsFull := false;
 If ((topPointer + 1) = STACK_SIZE) then
  IsFull := true;
End;  

Function Pop (var myStack : Array of Integer; var topPointer : Integer): Integer;
Begin
 If not IsEmpty(topPointer) then
  Begin
   Pop := myStack[topPointer];
   topPointer := topPointer - 1; 
  End;
End;

Procedure Push(var myStack : Array of Integer; item : Integer; var topPointer : Integer);
Begin
 If not IsFull(topPointer) then
  Begin
   myStack[topPointer+1] := item;
   topPointer := topPointer + 1;
  End;
End;                

Function GetSize(topPointer : Integer) : Integer;
Begin
 GetSize := topPointer;
End; 

Procedure cleanStack(var myStack : Array of Integer; var topPointer : Integer);
Begin
 while (not IsEmpty(topPointer)) do
   Pop(myStack,topPointer)
End;

{Programa principal}
begin
  InitStack(topPointerOperands);
  Push(operands,1,topPointerOperands);
  Push(operands,2,topPointerOperands);
  Push(operands,3,topPointerOperands);
  Push(operands,4,topPointerOperands);
  writeln('Cantidad elementos cargados : ',GetSize(topPointerOperands));
  while (not IsEmpty(topPointerOperands)) do
    writeln('Elemento popeado = ', pop(operands,topPointerOperands));
end.