:- set_prolog_flag(stack_limit,  4 000 000 000).
:- ensure_loaded(library(lists)).




% Initialises and runs a single round.
%
play :-
	%%write code here (Exercise 10).
    

% Prints scores.
%
% @param FinalTable  The final card allocation on the table.
%
printScores([Dealer|Rest]) :-                                                          														
    %%write code here (Exercise 9e).
    

% Gets the highest possible score of the input hand
% (depending on whether ace is counted as 1 or 10).
%
% @param Sc    The optimal score of the input hand.
% @param Hand  A list of player's cards
%
scoreTop(Sc, Hand) :-
	%%write code here (Exercise 9c).
    

% A predicate collection for a single game - the game engine.
%
% @param FinalTable  The table after the whole round.
% @param Table       The initial table - initial deal.
% @param Deck        The deck of cards to draw additional cards.
% @param Refused     0 = allow to draw another card, 1 = do not allow
%
theGame(Table, Table, _, Refused) :-
    Refused = 1,
	write('The End'), nl,
	write('================================================================================'), nl,
	!.
    
% play the game
theGame(FinalTable, Table, Deck, Refused) :-
    %%write code here.
    


% Checks the status of the game - instant win/lose; returns all possible 
% scores of each hand on the table.
%
% @param ScoreTable  The player's status in the game: -1 - more than 
%                    21 points; 0 - less than 21 points; 1 - exactly 21 points.
% @param Table       List of cards held by both players (list of lists).
%
checkBJ( ScoreTable, Table ) :-
    %%write code here (Exercise 9d).
	

% Nicely prints out a game state. It assumes that the first player on the 
% table is the dealer.
%
% @param Table  List of cards held by both players (list of lists).
% @param Type   Type of a line(s) to be printed `initial`: the first one or `cont`: 
%               any other.
%
printGame([Dealer|Rest], Type) :-                                                                           
%%write code for printHand here (Exercise 8b).
	

% Nicely prints out a hand of cards. Can be used for both dealer by hiding the 
% first card or by players by showing all of the cards - see the parameters for 
% details.
%
% @param Hand  A hand of player to be printed (list of `card` predicates).
% @param N     0: hides the first card; 1: shows all the cards.
% @param Type  Type of a line to be printed `initial`: the first one or `cont`: 
%              any other.
%
%%write code for printHand here (Exercise 8a).
