import Data.List
import Data.Maybe
import System.IO 

{-
	Assumption Taken:: Whenever you will call fixture "all", it will give same fixture all time, if you want to change 
					   combination, then we can change value k as in below.
-}

k=3

--Time and date combinations used in the question 
time_date = [(1,9.5), (1,19.5), (2,9.5), (2,19.5), (3,9.5), (3,19.5)]
date_time = [("1-12-2020", "9:30"), ("1-12-2020", "7:30"), ("2-12-2020", "9:30"), ("2-12-2020", "7:30"), ("3-12-2020", "9:30"), ("3-12-2020", "7:30")]

--permutation of a all teams and taking the first permutation of the team_list
team_list = permutations ["BS", "CM", "CH", "CV", "CS", "DS", "EE", "HU", "MA", "ME","PH", "ST"]!!k

{-
	match pair is taken by above team list where xth and (x+1)th index of team is paired with each other
-}
len=length(team_list)-1
match_pair = zip ([ team_list!!x | x<-[0,2..len] ]) ([ team_list!!x | x<-[1,3..len] ])

--printing xth match taken from match_pair combination and date_time
match :: Int -> IO()
match x = do
	putStrLn ((fst $ match_pair!!x) ++ "  vs  " ++ (snd $ match_pair!!x) ++ "    " ++ (fst $ date_time!!x) ++ "    " ++ (snd $ date_time!!x))

{-
	It prints all possible matches from 1-12-2020 to 3-12-2020
-}
fixture :: String -> IO()
fixture "all" = do
	match 0
	match 1
	match 2
	match 3
	match 4
	match 5

--prints the match that is played by x team
fixture x = do
	if x `elem` team_list
		then match ((fromJust(x `elemIndex` team_list)) `div` 2)
	else
		putStrLn "Team is not found."

--prints next match schedule if all date and time are valid
nextmatch :: Int -> Float -> IO()
nextmatch date time = do
	let possible_matches = ([x | x <- [0,1,2,3,4,5], (date, time) <= (time_date!!x)])
	if (date>3 || date<1)
		then putStrLn "First Round Match need to happened in between date 1-12-2020 to 3-12-2020."
	else if (time>=24.0 || time<0.0)
		then putStrLn "Wrong Time"
	else if (length(possible_matches)>0)
		then match (possible_matches!!0)
	else putStrLn "next matches not scheduled"


