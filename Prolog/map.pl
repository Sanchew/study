diff(red,green).
diff(red,blue).
diff(green,red).
diff(green,blue).
diff(blue,red).
diff(blue,green).

coloring(A, M, G, T, F) :-
 diff(M,T),
 diff(M,A),
 diff(A,T),
 diff(A,M),
 diff(A,G),
 diff(A,F),
 diff(G,F),
 diff(G,T).
