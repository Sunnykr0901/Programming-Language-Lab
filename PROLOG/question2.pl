%ASSUMPTION - I have only considered time consumed between travelling from A to B.

% Bus Details bus(Number,Origin,Destination,Departure Time,Arrival Time,Distance,Cost)

%Below graph represent all routes 


%
%  a -- b ---- e
%   \         /|
%    \       / |
%     c -- d --|------- f
%     /      \ |
%    /        \|
%    h         g
%

bus(123,a,b,11.0,12.0,50,200).
bus(123,b,e,12.0,14.5,75,250).

bus(756,a,c,11.0,12.0,40,100).
bus(756,c,d,13.4,17.0,150,400).

bus(153,e,d,15.0,17.0,10,200).
bus(153,d,f,18.5,20.5,200,100).
bus(153,d,g,17.1,20.0,250,250).

bus(823,e,g,14.5,16.0,100,500).
bus(823,c,h,20.2,21.0,150,50).

% checks if a variable is instantiated or not
inst(Variable):- \+(\+(Variable=0)), \+(\+(Variable=1)).


%checking for edge between X and Y, also calculating TIME as travelling time
edge(X,Y,B,ARRIVAL,DIST,TIME,COST):- bus(B,X,Y,DEPARTURE,ARRIVAL,DIST,COST), TIME is ARRIVAL-DEPARTURE.


%recursively call "dfs" function for finding all possible paths from city X to city Y 
dfs(X,Y,[BUS],[X,Y],DIST,TIME,COST,DEPARTURE):- inst(DEPARTURE), edge(X,Y,BUS,_,DIST,TIME,COST);
	\+(inst(DEPARTURE)), edge(X,Y,BUS,ARRIVAL,DIST,TIME,COST), ARRIVAL >= DEPARTURE.


dfs(X,Y,[B|BUS],[X|PATH],DIST,TIME,COST,_):- edge(X,Z,B,DEPARTURE,D1,T1,C1), dfs(Z,Y,BUS,PATH,D2,T2,C2,DEPARTURE), DIST is D1+D2, TIME is T1+T2, COST is C1+C2.


% PART A

% After finding all possible paths from source to destination, we sort the path by distance and stored in sorted path
% So we will get a list of list or 2D list and 1st list will give minimum distance and the corresponding path.
findminPath_by_Distance(X,Y):- 
	findall([DIST,BUS,PATH,TIME,COST],dfs(X,Y,BUS,PATH,DIST,TIME,COST,_),AllPaths),
	sort(AllPaths,SortedPaths),
	SortedPaths=[[DIST,BUS,PATH,TIME,COST]|_],
	write("Shortest Path: "),write(PATH),nl,
	write("Bus No: "),write(BUS),nl,
	write("Minimum Distance: "),write(DIST),nl,
	write("Total Time: "),write(TIME),nl,
	write("Total Cost: "),write(COST),nl;
	write("Path not exists!").


% PART B

% After finding all possible paths from source to destination, we sort the path by time and stored in sorted path
% So we will get a list of list or 2D list and 1st list will give minimum time and the corresponding path.
findminPath_by_Time(X,Y):-
	findall([TIME,BUS,PATH,DIST,COST],dfs(X,Y,BUS,PATH,DIST,TIME,COST,_),AllPaths),
	sort(AllPaths,SortedPaths),
	SortedPaths=[[TIME,BUS,PATH,DIST,COST]|_],
	write("Shortest Path: "),write(PATH),nl,
	write("Bus No: "),write(BUS),nl,
	write("Minimum Time: "),write(TIME),nl,
	write("Total Distance: "),write(DIST),nl,
	write("Total Cost: "),write(COST),nl;
	write("Path not exists!").


% PART C

% After finding all possible paths from source to destination, we sort the path by cost and stored in sorted path
% So we will get a list of list or 2D list and 1st list will give minimum cost and the corresponding path.
findminPath_by_Cost(X,Y):-
	findall([COST,BUS,PATH,TIME,DIST],dfs(X,Y,BUS,PATH,DIST,TIME,COST,_),AllPaths),
	sort(AllPaths,SortedPaths),
	SortedPaths=[[COST,BUS,PATH,TIME,DIST]|_],
	write("Shortest Path: "),write(PATH),nl,
	write("Bus No: "),write(BUS),nl,
	write("Minimum Cost: "),write(COST),nl,
	write("Total Distance: "),write(DIST),nl,
	write("Total Time: "),write(TIME),nl;
	write("Path not exists!").
