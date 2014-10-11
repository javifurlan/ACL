/*
PROGRAMA ORIGINAL
local Max A B C in
   fun {Max X Y}
      if X>=Y then X else Y end
   end
   A = 3
   B = 2
   {Browse {Max A B}}
end
*/
%PROGRAMA TRADUCIDO A KERNEL
local Max in
   local A in
      local B in
	 local C in
	    Max = proc{$X Y ?R}
		     C = X>=Y
		     if C then
			R=X
		     else
			R=Y
		     end
		  end
	    local F in
	       A=3
	       B=2
	       {Max A B F}
	       {Browse F}
	    end
	 end
      end
   end
end

	 

   