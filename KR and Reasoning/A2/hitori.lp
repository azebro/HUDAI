
%The N number, it will be used to generate NxN board (4.a)
#const n = 8.
%x and y coordinates. In theory the board has to be square, 
%so could operate on a single variable
x(1..n).
y(1..n).
%The actual value of the cell
z(1..9).
%generate the random board (4.c)
{cell(X,Y,N): z(N)} = 1 :- x(X) ,y(Y).

%Evaluate the adjacement rules (T2.1):
%No row or column can have more than one occurrence of any given number
%(in the squares that have not been blacked out).

adjacent(X,Y,X+1,Y) :- cell(X,Y,_), cell(X+1,Y,_).
adjacent(X,Y,X,Y+1) :- cell(X,Y,_), cell(X,Y+1,_).
adjacent(X2,Y2,X1,Y1) :- adjacent(X1,Y1,X2,Y2).
%The solution is the collection of black(X,Y) indicating the 
%blackened squares, either blacked or not
%black represent solved board (4.b)
{ black(X,Y) } :- cell(X,Y,_).
%%Evaluate the adjacement rules (T2.2):
%Blacked out squares cannot be horizontally or vertically adjacent.
:- adjacent(X1,Y1,X2,Y2), black(X1,Y1), black(X2,Y2).
:- cell(X1,Y1,N), 2 { not black(X1,Y2) : cell(X1,Y2,N) }.
:- cell(X1,Y1,N), 2 { not black(X2,Y1) : cell(X2,Y1,N) }.

%%Evaluate the adjacement rules (T2.3):
%Every numbered square (that has not been blacked out) must be reachable
% by any other numbered square through a path that does not pass through 
%blacked out squares.

%
% Define mutual reachability 6a, but it can be further optimised
%reachable(X1,Y1,X2,Y2) :- adjacent(X1,Y1,X2,Y2), (X1,Y1) < (X2,Y2), not black(X1,Y1), not black(X2,Y2).
%reachable(X1,Y1,X3,Y3) :- reachable(X1,Y1,X2,Y2), reachable(X2,Y2,X3,Y3).
%reachable(X1,Y1,X3,Y3) :- reachable(X1,Y1,X2,Y2), reachable(X3,Y3,X2,Y2),(X1,Y1) < (X3,Y3).
%reachable(X2,Y2,X3,Y3) :- reachable(X1,Y1,X2,Y2), reachable(X1,Y1,X3,Y3),(X2,Y2) < (X3,Y3).
% Can't have mutually unreachable non-black squares
%:- not black(X1,Y1), not black(X2,Y2), not reachable(X1,Y1,X2,Y2),
%(X1,Y1) < (X2,Y2), cell(X1,Y1,_), cell(X2,Y2,_).
%Further optimisation
reachable(1,1).
reachable(1,2).
reachable(X2,Y2) :- reachable(X1,Y1), adjacent(X1,Y1,X2,Y2), not black(X1,Y1).
%All need to be reachable
:- cell(X,Y,_), not black(X,Y), not reachable(X,Y).

%#show cell/3.
%show black.

