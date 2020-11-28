{-
	I have used list as input for various set operations.
	So,Please provide list as inputs.

	You have to give an integer list as input.
-}

import Data.List
import System.IO 

-- Global function
-- Function used to remove duplicates from a list
removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates list = remDups list []

remDups :: (Eq a) => [a] -> [a] -> [a]
remDups [] _ = []
remDups (x:xs) list2
    | (x `elem` list2) = remDups xs list2
    | otherwise = x : remDups xs (x:list2)


--checking the set is valid or not by checking duplicates in the list
valid_set :: [Int] -> Bool
valid_set x = (length(z)==length(x))
    where 
        z = removeDuplicates x

--PART (A)
--checking if a set is empty or not
is_empty :: [Int] -> IO()
is_empty x = do
	let z = valid_set x
	if (z==True)
		then 
			if (null x ==True)
				then putStrLn "True"
			else 
				putStrLn "False"
	else
		putStrLn "Not a valid set"



--PART (B)
--union of two sets
union_set :: [Int] -> [Int] -> IO()
union_set x y = do
	let z = [p | p <- x, p `notElem` y]
	let	k = z ++ y
	if (valid_set x ==False || valid_set y ==False)
		then putStrLn "Not valid input sets"
	else 
		print(k)



--PART (C)
--intersection of two sets
intersection_set :: [Int] -> [Int] -> IO()
intersection_set x y = do
	let	k = [p | p <- x, p `elem` y]
	if (valid_set x ==False || valid_set y ==False)
		then putStrLn "Not valid input sets"
	else 
		print(k)



--PART (D)
--subtraction of two sets
subtraction_set :: [Int] -> [Int] -> IO()
subtraction_set x y = do
	let	k = [p | p <- x,  p `notElem` y]
	if (valid_set x ==False || valid_set y ==False)
		then putStrLn "Not valid input sets"
	else 
		print(k)



--PART (E)
--addition of two sets
addition_set :: [Int] -> [Int] -> IO()
addition_set x y = do
	let	z = [p+q | p <- x, q <- y]
	let	k = removeDuplicates z
	if (valid_set x ==False || valid_set y ==False)
		then putStrLn "Not valid input sets"
	else 
		print(k)


