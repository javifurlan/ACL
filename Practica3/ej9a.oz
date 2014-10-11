/*PROGRAMA ORIGINAL
fun {Length Ls}
   case Ls
   of nil then 0
   [] _|Lr then 1+{Length Lr}
   end
end
*/

%PROGRAMA CON RECURSIVIDAD A LA COLA
local X 
   fun{Lenght Ls ?R}
      case Ls
      of nil then R=0
      [] _|Lr then
	 local A in
	    A=1
	    R=R+A
	    {Lenght Lr R}
	 end
      end
   end
in
   {Length [1 2 2 23 4] X}
   {Browse X}
end
