
valid_queen((Row, Col)) :-
 Range = [1, 2, 3, 4, 5, 6, 7, 8],
 member(Row, Range),member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

rows([], []).
rows([(Row, _)|Tail], [Row|RowTail]) :-
 rows(Tail, RowTail).

cols([], []).
cols([(_, Col)|Tail], [Col|ColTail]) :-
 cols(Tail, ColTail).

diags1([], []).
diags1([(Row, Col)|Tail], [Diagonal|DiagonalsTail]) :-
 Diagonal is Col - Row,
 diags1(Tail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|Tail], [Diagonal|DiagonalsTail]) :-
 Diagonal is Col + Row,
 diags2(Tail, DiagonalsTail).

eight_queens(Board) :-
 length(Board, 8),
 valid_board(Board),
 rows(Board, Rows),
 cols(Board, Cols),
 diags1(Board, Diags1),
 diags2(Board, Diags2),
 fd_all_different(Rows),
 fd_all_different(Cols),
 fd_all_different(Diags1),
 fd_all_different(Diags2).
