
% Find some implementations of a Fibonacci series and factorials.
fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, X) :- N1 is N-1, N2 is N-2, fib(N1, X1), fib(N2, X2), X is X1 + X2.

% How do they work?
    % Naive recursion


% A real-world community using Prolog. What problems are they solving with it today?
    % http://stackoverflow.com/questions/130097/real-world-prolog-usage


% An implementation of the Towers of Hanoi.
hanoi(N) :- hanoi(N, left, center, right).

hanoi(0, _ , _ , _ ) :- !.
hanoi(N, X, Y, Z) :-
    N1 is N-1,
    hanoi(N1, X, Z, Y),
    move(X, Z),
    hanoi(N1, Y, X, Z).

move(From, To) :- write([move, From, -->, To]), nl.

% How does it work?
    % Unification. Yay!


% What are some of the problems of dealing with "not" expressions?
% Why do you have to be careful with negation in Prolog?
    % Negation as failure
    % Because negation of X doesn't mean that X is false, it means that X can't be proven true
