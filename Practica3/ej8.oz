/*
PROGRAMA ORIGINAL
proc {Loop5 I}
   local C in
      C = I == 5
      if C then skip
      else
	 local J in
	    J = I + 5
	    {Loop5 J}
	 end
      end
   end
end
*/

%TRADUCCION A KERNEL
local Loop5 in
   Loop5 = proc{$I}
	      local C in
		 C=I==5
		 if C then skip
		 else
		    local J in
		       J=I+5
		       {Browse J}
		       {Loop5 J}
		    end
		 end
	      end
	   end
   {Loop5 0} %La invocacion no esta en kernel, habría que agreagr un local X in
                                                                       % X = 0
                                                                       % {Loop5 X}
end

      