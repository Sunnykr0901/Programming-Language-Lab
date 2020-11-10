% Pair of gates and distance between the gates

edge('G1','G5',4).
edge('G2','G5',6).
edge('G3','G5',8).
edge('G4','G5',9).
edge('G1','G6',10).
edge('G2','G6',9).
edge('G3','G6',3).
edge('G4','G6',5).
edge('G5','G7',3).
edge('G5','G10',4).
edge('G5','G11',6).
edge('G5','G12',7).
edge('G5','G6',7).
edge('G5','G8',9).
edge('G6','G8',2).
edge('G6','G12',3).
edge('G6','G11',5).
edge('G6','G10',9).
edge('G6','G7',10).
edge('G7','G10',2).
edge('G7','G11',5).
edge('G7','G12',7).
edge('G7','G8',10).
edge('G8','G9',3).
edge('G8','G12',3).
edge('G8','G11',4).
edge('G8','G10',8).
edge('G10','G15',5).
edge('G10','G11',2).
edge('G10','G12',5).
edge('G11','G15',4).
edge('G11','G13',5).
edge('G11','G12',4).
edge('G12','G13',7).
edge('G12','G14',8).
edge('G15','G13',3).
edge('G13','G14',4).
edge('G14','G17',5).
edge('G14','G18',4).
edge('G17','G18',8).
edge('G5','G1',4).
edge('G5','G2',6).
edge('G5','G3',8).
edge('G5','G4',9).
edge('G6','G1',10).
edge('G6','G2',9).
edge('G6','G3',3).
edge('G6','G4',5).
edge('G7','G5',3).
edge('G10','G5',4).
edge('G11','G5',6).
edge('G12','G5',7).
edge('G6','G5',7).
edge('G8','G5',9).
edge('G8','G6',2).
edge('G12','G6',3).
edge('G11','G6',5).
edge('G10','G6',9).
edge('G7','G6',10).
edge('G10','G7',2).
edge('G11','G7',5).
edge('G12','G7',7).
edge('G8','G7',10).
edge('G9','G8',3).
edge('G12','G8',3).
edge('G11','G8',4).
edge('G10','G8',8).
edge('G15','G10',5).
edge('G11','G10',2).
edge('G12','G10',5).
edge('G15','G11',4).
edge('G13','G11',5).
edge('G12','G11',4).
edge('G13','G12',7).
edge('G14','G12',8).
edge('G13','G15',3).
edge('G14','G13',4).
edge('G17','G14',5).
edge('G18','G14',4).
edge('G18','G17',8).

% PART A 

% dfs check whether a vertex is already visited in the path or not if visited then that vertex will be not again considered in that path.
dfs(X,Y,[X,Y],DIST,_):- edge(X,Y,DIST).
dfs(X,Y,[X|P1],DIST,VISITED):- \+member(X,VISITED), edge(X,Z,D1), dfs(Z,Y,P1,D2,[X|VISITED]), DIST is D1+D2.

% checking that the list is empty or not
is_empty([]).

% Print all paths
print_paths([H|T]):-
	\+is_empty(H),
	write(H),nl,
	print_paths(T);
	is_empty(H),!.


% find all paths using dfs starting from G1,G2,G3,G4
findallpaths():- 
	findall([DIST,PATH],dfs('G1','G17',PATH,DIST,[]),P1),
	findall([DIST,PATH],dfs('G2','G17',PATH,DIST,[]),P2),
	findall([DIST,PATH],dfs('G3','G17',PATH,DIST,[]),P3),
	findall([DIST,PATH],dfs('G4','G17',PATH,DIST,[]),P4),
	print_paths(P1),nl,
	print_paths(P2),nl,
	print_paths(P3),nl,
	print_paths(P4),nl.

% PART B 

% find all possible paths with total distance and then sort by distace covered, then print the first path with minimum distance
findminpath():-
	findall([DIST,PATH],dfs('G1','G17',PATH,DIST,[]),P1),
	findall([DIST,PATH],dfs('G2','G17',PATH,DIST,[]),P2),
	findall([DIST,PATH],dfs('G3','G17',PATH,DIST,[]),P3),
	findall([DIST,PATH],dfs('G4','G17',PATH,DIST,[]),P4),
	append(P1,P2,Allpaths1),
	append(P3,P4,Allpaths2),
	append(Allpaths1,Allpaths2,Allpaths),
	sort(Allpaths,SortedPath),
	SortedPath=[[DIST|PATH]|_],
	write("Shortest Path: "),write(PATH),nl,
	write("Min distance: "),write(DIST),nl.
	
% PART C


% path validation checking 
% check first one of (G1,G2,G3,G4) is present in the starting of the path or not
% if present then going through remaining vertex checking the edges are exist or not 
% and then at last check ending gate is G17 or not
path([H|T]):-
	is_empty(T),
	member(H,['G17']),!;
	\+is_empty(T),
	T=[T1|_],
	edge(H,T1,_),
	path(T).

is_path([H|T]):-
	member(H,['G1','G2','G3','G4']),
	path([H|T]).

