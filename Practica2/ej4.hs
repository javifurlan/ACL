func :: a -> b -> a
func x y | True = x
		 | otherwise = x + y 

main = do 
	print(func 3 5.25)