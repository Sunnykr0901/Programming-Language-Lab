{-
	I have used list as input for various set operations.
	So,Please provide list as inputs.

	You have to give an integer list as input containg no duplicates
	because you are providing input as a list for set.
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
    

--PART (A)
--checking if a set is empty or not

is_empty :: [Int] -> Bool
is_empty x = null x



--PART (B)

union_set :: [Int] -> [Int] -> [Int]
union_set x y = k
	where
		z = [p | p <- x, p `notElem` y]
		k = z ++ y



--PART (C)

intersection_set :: [Int] -> [Int] -> [Int]
intersection_set x y = k
	where
		k = [p | p <- x, p `elem` y]



--PART (D)

subtraction_set x y = k
	where
		k = [p | p <- x,  p `notElem` y]



--PART (E)

addition_set x y = k
	where
		z = [p+q | p <- x, q <- y]
		k = removeDuplicates z


