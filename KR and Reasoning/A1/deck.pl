:- module( deck,
  [deck/1,
   shuffle/3,
   initDeal/3,
   score/2,
   askCard/1,
   addCard/4]
  ).

%%write code here (Exercise 6a).
	
% Generates deck.
%
% @param Deck  Generated deck.
%
deck(Deck) :-
	%%write code here (Exercise 6b).


% Deals the cards from the `Deck`. The initial deal consists of two cards given 
% to the player and two cards for the house. This predicate returns the new deck 
% without just dealt cards and the table i.e. list of lists containing cards of 
% both players.
%
% @param Table    List of cards held by both players (list of lists).
% @param NewDeck  Deck(s) of card with removed cards that were used for initial 
%                 deal.
% @param Deck     Deck(s) of cards used for initial deal.
%
initDeal(Table, NewDeck, Deck) :-                                                              
    %%write code here (Exercise 7a).
	
Asks whether the user wants to get a new card.
%
% @param Answer  Boolean valued decision variable: 1 (yes) or 0 (no).
%
askCard(Answer) :-
	%%write code here (Exercise 7b).
	
% Deals additional card to player. After the                      
% deal it returns new deck and new hand of given player.
%
% @param NewTable   List of cards held by all player (list of lists) **after** 
%                  adding a new card.
% @param NewDeck   **New** list of cards remaining in the deck after current 
%                  round.
% @param Deck   Current list of cards in the deck after.
% @param Table   List of cards held by all player (list of lists) **before** 
%                  adding a new card.
%
addCard(NewTable, NewDeck, [Card|NewDeck], [Dealer|Rest]) :-
	%%write code here (Exercise 7c).

% Calculates score of player's hand.
%
% @param Score  Value of given hand.
% @param Hand   A list of `card` predicates.
%
score( Score, Hand ) :- 
	%%write code here (Exercise 9b).

% Calculates value of a card.
%
% @param Score  Value of given hand.
% @param Hand   A list of `card` predicates.
%
value( Value, card( _, R ) ) :-
	%%write code here (Exercise 9a).

% Manages shuffling
%
% @param Shuffled  The shuffled deck (list of `card` predicate).
% @param Deck      The deck to be shuffled (list of `card` predicate).
% @param N         Number of shuffles.
%
shuffle(Shf, Shf, 0) :-
	!.
shuffle(Shuffled, Deck, N) :-
	proper_length(Deck, Len),
	Half is Len / 2,
	getPiles(A, _, Half),
	A1 is A + 1,
	split(P1, P2, Deck, A1), % get two piles
    rifleRan(Forward, P1, P2),
	N1 is N - 1,
	shuffle( Shuffled, Forward, N1 ).
	
%% split(-A, -B, +List, +Num) is det.
%
% Split a list into two sub-lists at given index. Index can be 1:# of elements 
% in the input list. The indexing starts at 1. The specified index and all of 
% the following elements will be placed in the second list.
%
% @param A     Pre-index sub-list.
% @param B     Post-index sub-list.
% @param List  The list to be split.
% @param Num   The list to be split.
%
split(A, B, List, Num) :-
	split_(A, [], List, Num),
	append(A, B, List).
split_(A, A, _, 1) :- !.
split_(A, A, _, 1.0) :- !.
split_(A, Acum, [H|T], Num) :-
	NumN is Num - 1,
	append(Acum, [H], Sup),
	split_(A, Sup, T, NumN).	

% Rifle-shuffle two piles of cards with *random* card selection i.e. split the 
% deck into two parts and merge them by tossing a coin for each card to decide 
% whether it goes on the top or bottom of the merged pile.
%
% @param Out  Merged deck (list of predicates `card`).
% @param A    1st part of deck to be merged (list of predicates `card`).
% @param B    2nd part of deck to be merged (list of predicates `card`).
%
rifleRan(Out, A, B) :-
	random(0, 2, Rand), % decide whether left pile goes on top or bottom
	rifleRan(Out, [], A, B, Rand).
rifleRan(Out, Em, [A1|A2], [B1|B2], 0) :-
	append(Em, [A1], O1),
	append(O1, [B1], O2),
	random(0, 2, Rand),
	rifleRan(Out, O2, A2, B2, Rand).
rifleRan(Out, Em, [A1|A2], [B1|B2], 1) :-
	append(Em, [B1], O1),
	append(O1, [A1], O2),
	random(0, 2, Rand),
	rifleRan(Out, O2, A2, B2, Rand).
rifleRan(Out, Em, [], [B1|B2], Rand) :-
	append(Em, [B1], O),
	rifleRan(Out, O, [], B2, Rand).
rifleRan(Out, Em, [A1|A2], [], Rand) :-
	append(Em, [A1], O),
	rifleRan(Out, O, A2, [], Rand).
rifleRan(Out, Out, [], [], _) :-
	!.

% Generates two piles counters: if the number of cards in the deck is **odd** 
% then it is impossible to split it equally. This predicate takes a float 
% number and outputs two numbers one a half bigger and one a half smaller to 
% create two integers. In general 2*`Half`=`A`+`B`.
%
% @param A     Number rounded to an integer based on above rule.
% @param B     Number rounded to an integer based on above rule.
% @param Half  A number to be rounded based on above rule.
%
getPiles(A, B, Half) :-
	float(Half),
	random(0,2,Rand), % decide whether round up left or right pile
	( Rand = 0 -> A is Half - 0.5, B is Half + 0.5
	; Rand = 1 -> A is Half + 0.5, B is Half - 0.5
	),
	!.
getPiles(Half, Half, Half) :-
	integer(Half).


