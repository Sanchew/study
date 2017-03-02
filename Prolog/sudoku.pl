valid_data([]).
valid_data([Head|Tail]) :-
 fd_domain(Head, 1, 9),
 valid_data(Tail).

find_cols(Cols, Puzzle) :-
 
sudoku(Puzzle, Solution) :-
 Solution = Puzzle,
 Puzzle = [Row1, Row2, Row3, Row4, Row5, Row6, Row7 Row8, Row9],
 valid_data(Puzzle),
 
