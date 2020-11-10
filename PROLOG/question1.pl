%PARENT relationships

parent('jatin','avantika').
parent('jolly','jatin').
parent('jolly','katappa').
parent('manisha','avantika').
parent('manisha','shivkami').
parent('bahubali','shivkami').

%GENDER relationships

male('katappa').
male('jolly').
male('bahubali').

female('shivkami').
female('avantika').

/* we can define uncle relationships as X is uncle of Y iff all below conditions must be satisfied

	condition 1.> X should be male.
	condition 2.> X must be brother of Y's parent that is parent(X)=parent(parent(Y)).
*/

uncle(X,Y):- male(X),parent(W,Y),parent(Z,W),parent(Z,X).

/* we can define halfsister relationships as X is halfsister of Y iff all below conditions must be satisfied

	condition 1.> X should be female.
	condition 2.> There should be only 1 common parent between X and Y.
*/

halfsister(X,Y):- female(X),parent(W1,X),parent(W2,X),parent(W1,Y),parent(W3,Y),not(X==Y),not(W2==W3),not(W1==W2),not(W1==W3).