append([],List,List).
append([Head|Tail1], List, [Head|Tail2]) :-
 append(Tail1, List, Tail2).

sum(0,[]).
sum(Count, [_|Tail]) :-
 sum(Sc, Tail), Count is Sc + 1.

fib(1,1).
fib(2,1).
fib(N,R) :-
 N > 2,N1 is N - 1,N2 is N - 2,fib(N1,R1),fib(N2,R2),R is R1 + R2.

reverse([],[]).
reverse([H|T],N) :-
 reverse(T,X),
 append(X,[H],N).

min([X],X).
min([H|T],X) :- 
 min(T,M),X is min(H,M).


sort([X],[X]).
sort([H|T],R) :-
 sort(T,X),insert(H,X,R).

insert(X,[],[X]).
insert(E,L,R) :- L = [H,T],
 (E < H -> append([E],L,R);
  insert(E, T, MT),
  append(H,MT,R)
 ).
