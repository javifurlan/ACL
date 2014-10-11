Unit pilasChar;

interface

Procedure InitStackChar (VAR topPointer : Integer);
Function IsEmptyChar (topPointer : Integer): Boolean;
Function IsFullChar (topPointer : Integer): Boolean;
Function TopChar (var myStack : Array of Char; topPointer : Integer): Char;
Function PopChar (var myStack : Array of Char; var topPointer : Integer): Char;
Procedure PushChar (var myStack : Array of Char; item : Char; var topPointer : Integer);
Function GetSizeChar (topPointer : Integer) : Integer;
Procedure cleanStackChar (var myStack : Array of Char; var topPointer : Integer);

implementation 

Const
    STACK_SIZE = 100;

Procedure InitStackChar (VAR topPointer : Integer);
Begin
 topPointer := 0;
End;

Function IsEmptyChar (topPointer : Integer): Boolean;
Begin
 IsEmptyChar := false;
 If (topPointer = 0) then
  IsEmptyChar := true;
End; 

Function IsFullChar (topPointer : Integer): Boolean;
Begin
 IsFullChar := false;
 If ((topPointer + 1) = STACK_SIZE) then
  IsFullChar := true;
End;  

Function TopChar (var myStack : Array of Char; topPointer : Integer): Char;
begin
  topChar:=myStack[topPointer];
end;

Function PopChar (var myStack : Array of Char; var topPointer : Integer): Char;
Begin
 If not IsEmptyChar(topPointer) then
  Begin
   PopChar := myStack[topPointer];
   topPointer := topPointer - 1; 
  End;
End;

Procedure PushChar (var myStack : Array of Char; item : Char; var topPointer : Integer);
Begin
 If not IsFullChar(topPointer) then
  Begin
   myStack[topPointer+1] := item;
   topPointer := topPointer + 1;
  End;
End;                

Function GetSizeChar (topPointer : Integer) : Integer;
Begin
 GetSizeChar := topPointer;
End; 

Procedure cleanStackChar (var myStack : Array of Char; var topPointer : Integer);
Begin
  while (not IsEmptyChar(topPointer)) do begin
    PopChar(myStack,topPointer)
  end;
  InitStackChar(topPointer);
End;
end.