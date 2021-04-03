@define zomChess::PieceSquare currentPiece = zomChess::pieceSquareList[(8 * x) + y]

@if currentPiece.piece != -1
    @if currentPiece.colour == true
        @var currentPiece.location.set(zomChess::whitePieceColour[currentPiece.piece] + "_carpet")
    @else
        @var currentPiece.location.set(zomChess::blackPieceColour[currentPiece.piece] + "_carpet")
    @fi
@else
    @var currentPiece.location.set("air")
@fi