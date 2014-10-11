local Reverse XS in
   fun {Reverse XS}
      local Res in
	 {NewCell nil Res}
	 for X in XS do
	    Res:=X|@Res
	 end
	 @Res
      end
   end
   XS=[1 2 3 4]
   {Browse {Reverse XS}}
end
