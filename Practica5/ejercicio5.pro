check([],YS,YS).
check(XS,[],XS).
check(X:XS,YS,X:ZS) :- check(XS,YS,ZS).
