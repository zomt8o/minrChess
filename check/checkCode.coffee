@using zomChess

@var checking = true

@var whiteCheck = false
@var blackCheck = false


@define PieceSquare kingPiece = pieceSquareList[kingLoc]

@var bishopMove(kingPiece)
@var rookMove(kingPiece)
@var knightMove(kingPiece)

@if whiteCheck == true || blackCheck == true
    @var gridFlash("red")
@fi

@var gridSquareList[kingLoc].location.set("red_concrete")

test stuff