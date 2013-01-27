
% Reverse the elements of a list.
revert([], []).
revert([Head], [Head]).
revert([Head|Tail], Reversed) :- revert(Tail, RevTail), append(RevTail, [Head], Reversed).

reverse(List1, List2).  % Out of the box


% Find the smallest element of a list.
minimum([Head], Head).
minimum([Head|Tail], Smallest) :- minimum(Tail, MinTail), Smallest is min(Head, MinTail).

min_list(List, Min).  % Out of the box


% Sort the elements of a list.
sort(List1, List2)  % Out of the box
