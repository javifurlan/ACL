/*
PROGRAMA ORIGINAL
local X Y in
   X = 1
   Y = 2 + X
   if X > Y then
      {Browse X}
   else
      {Browse Y}
   end
end
*/
%PROGRAMA TRADUCIDO A KERNEL
local X in
   local Y in
      X = 1
      {Number.'+' 2 X Y} %El procedimiento Number.'+' pertenece al módulo Number.
      local C in
	 C = (X > Y)
	 if C then
	    {Browse X}
	 else
	    {Browse Y}
	 end
      end
   end
end
