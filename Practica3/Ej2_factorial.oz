local Factorial in
   Factorial = proc{$N ?R}
		  local Cond in
		     local Aux1 in
			Aux1=0
			Cond=(N==Aux1)
			if Cond then R=1 else
			   local Res in
			      local Aux2 in
				 Aux2=N-1
				 {Factorial Aux2 Res}
				 R=(N*Res)
			      end
			   end
			end
		     end
		  end
end
   local F in
      local Aux3 in
	 Aux3=5
	 {Factorial Aux3 F}
	 {Browse F}
      end
   end
end