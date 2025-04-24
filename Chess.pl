# Prolog-Project
chess_board([
 (1,1)-piece(white,rook), (1,2)-piece(white,knight),
 (1,3)-piece(white,bishop), (1,4)-piece(white,queen),
 (1,5)-piece(white,king), (1,6)-piece(white,bishop),
 (1,7)-piece(white,knight), (1,8)-piece(white,rook),
 (2,1)-piece(white,pawn), (2,2)-piece(white,pawn),
 (2,3)-piece(white,pawn), (2,4)-piece(white,pawn),
 (2,5)-piece(white,pawn), (2,6)-piece(white,pawn),
 (2,7)-piece(white,pawn), (2,8)-piece(white,pawn),
 (7,1)-piece(black,pawn), (7,2)-piece(black,pawn),
 (7,3)-piece(black,pawn), (7,4)-piece(black,pawn),
 (7,5)-piece(black,pawn), (7,6)-piece(black,pawn),
 (7,7)-piece(black,pawn), (7,8)-piece(black,pawn),
 (8,1)-piece(black,rook), (8,2)-piece(black,knight),
 (8,3)-piece(black,bishop), (8,4)-piece(black,queen),
 (8,5)-piece(black,king), (8,6)-piece(black,bishop),
 (8,7)-piece(black,knight), (8,8)-piece(black,rook)
]).
can_move((Row, Col), (NextRow, Col), piece(white, pawn)) :-
 NextRow is Row + 1,
 NextRow =< 8.
can_move((Row, Col), (NextRow, Col), piece(black, pawn)) :-
 NextRow is Row - 1,
 NextRow >= 1.
can_move((Row, Col), (NewRow, NewCol), piece(_, knight)) :-
 member((DR, DC), [(2,1),(2,-1),(-2,1),(-2,-1),(1,2),(1,-2),(-1,2),(-1,-2)]),
 NewRow is Row + DR,
 NewCol is Col + DC,
 NewRow >= 1, NewRow =< 8,
 NewCol >= 1, NewCol =< 8.
can_move((Row, Col), (NewRow, Col), piece(_, rook)) :-
 NewCol \= Col.
can_move((Row, Col), (NewRow, NewCol), piece(_, rook)) :-
 NewRow \= Row.
make_move(BoardState, PosFrom, PosTo, Piece, UpdatedBoard) :-
 member(PosFrom-Piece, BoardState),
 can_move(PosFrom, PosTo, Piece),
 delete(BoardState, PosFrom-Piece, TempState),
 delete(TempState, PosTo-_, CleanedState),
 UpdatedBoard = [PosTo-Piece | CleanedState].
