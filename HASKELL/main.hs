import Data.List
import System.IO 

removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates list = remDups list []

remDups :: (Eq a) => [a] -> [a] -> [a]
remDups [] _ = []
remDups (x:xs) list2
    | (x `elem` list2) = remDups xs list2
    | otherwise = x : remDups xs (x:list2)

is_empty :: [Int] -> Bool
is_empty x = null x

union_set :: [Int] -> [Int] -> [Int]
union_set x y = k
	where
		z = [p | p <- x, p `notElem` y]
		k = z ++ y

intersection_set :: [Int] -> [Int] -> [Int]
intersection_set x y = k
	where
		k = [p | p <- x, p `elem` y]

subtraction_set x y = k
	where
		k = [p | p <- x,  p `notElem` y]

addition_set x y = k
	where
		z = [p+q | p <- x, q <- y]
		k = removeDuplicates z



