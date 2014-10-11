/*
PROGRAMA ORIGINAL
fun {Sum1 N}
   if N==0 then 0 else N+{Sum1 N-1} end
end
*/

%PROGRAMA CON RECURSIVIDAD A LA COLA
local X
   fun {Sum1 N ?R}
      if N==0 then
	 0
      else
	 R=R+N
	 {Sum1 (N-1) R}
      end
   end
in  % illegal arity in application
   {Sum1 5 5 X}
   {Browse X}
end

/*
FUNCION SUMLIST
fun {SumList Ls}
   case Ls of
      nil then 0
      x|xs then x+{SumList xs}
   end
end
*/

/*
FUNCION FOLDR
fun{FoldR F B Xs}
   case Xs of
      nil then B
      Y|Ys then {F Y {FoldR B Ys}
		end
   end
end
*/

/*
FUNCION SUMLIST CON FOLDR
fun {SumList Ls}
   {FoldR (+) 0 Ls}
end
*/

/*¿QUE HACE ESTA FUNCION?
fun {Some Ls}
   {FoldR Ls (fun {$ X Y} X orelse Y end) false Ls}
end

EJEMPLOS:
[] = False

[false,false] = False

[false,false,true,false] = True

[false,(1==2),(5/5==1),(1/0==3)] = True   

DEVUELVE TRUE SII HAY AL MENOS UN TRUE EN LA LISTA   
*/