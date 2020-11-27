import Data.List
import System.IO 

main=do
	putStrLn "This works."

sumofNums=sum[1..100]
--parmanent:: Int
k= 5 `mod` 3

list=[x*2 | x<-[1..10],x<5]
second=list !! 2

evennumber=takeWhile (<=8) [2,4,6,8,10]

many3s=take 10 (cycle [1,2,3,4,5])

addExp=5+3
subExp=5-3
multExp=5*3
divExp=5/3

nextExp=multExp/subExp

s=subExp+addExp

addme:: Int->Int->Int
addme x y=x+y

-- Global function
-- Function used to remove duplicates from a list
removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates list = remDups list []

remDups :: (Eq a) => [a] -> [a] -> [a]
remDups [] _ = []
remDups (x:xs) list2
    | (x `elem` list2) = remDups xs list2
    | otherwise = x : remDups xs (x:list2)


