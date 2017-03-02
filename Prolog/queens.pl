valid_queen(Queen) :- Range = [1, 2, 3, 4, 5, 6, 7, 8], member(Queen, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).
 
eight_board([], 8, [], []).
eight_board([Head|Tail], Count, [L|DLTail], [R|DRTail]) :-
 CurrentCount is Count + 1,
 L is Head - CurrentCount,
 R is Head + CurrentCount,
 eight_board(Tail, CurrentCount, DLTail, DRTail).

eight_queens(Board) :-
 length(Board, 8),
 valid_board(Board),
 eight_board(Board, 0, DiagsL, DiagsR),
 fd_all_different(Board),
 fd_all_different(DiagsL),
 fd_all_different(DiagsR),
 show_queens(Board).

show_queens([]).
show_queens([Head|Tail]) :- show_queen(Head, 1), show_queens(Tail).

show_queen(Queen, Col) :-  
 (Queen == Col -> write(' * '); write(' _ ')),
 Next is Col + 1, 
 (Next < 9 -> show_queen(Queen, Next); nl).
