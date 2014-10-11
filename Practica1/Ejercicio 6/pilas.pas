Unit pilas;

interface

Procedure InitStack (VAR topPointer : Integer);
Function IsEmpty (topPointer : Integer): Boolean;
Function IsFull (topPointer : Integer): Boolean;
Function top (var myStack : Array of Integer; topPointer : Integer): Integer;
Function Pop (var myStack : Array of Integer; var topPointer : Integer): Integer;
Procedure Push(var myStack : Array of Integer; item : Integer; var topPointer : Integer);
Function GetSize(topPointer : Integer) : Integer;
Procedure cleanStack(var myStack : Array of Integer; var topPointer : Integer);

implementation 

Const
    STACK_SIZE = 100;

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

Function top (var myStack : Array of Integer; topPointer : Integer): Integer;
begin
  top:=myStack[topPointer];
end;

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
  while (not IsEmpty(topPointer)) do begin
    Pop(myStack,topPointer)
  end;
  InitStack(topPointer)
End;
end.