@using zomChess

@for Int x in Int[-1,0,1]
    @for Int y in Int[-1,0,1]
        @if ((8 * (currentPiece.x + x)) + (currentPiece.y + y)) < 64 && ((8 * (currentPiece.x + x)) + (currentPiece.y + y)) >= 0 && currentPiece.x + x >= 0 && currentPiece.y + y >= 0
            @if pieceSquareList[(8 * (currentPiece.x + x)) + (currentPiece.y + y)].occupied == false
                @var gridSquareList[(8 * (currentPiece.x + x)) + (currentPiece.y + y)].highlighted = true
                @var highlightedBlocks[highlightedBlocks.length()] = gridSquareList[(8 * (currentPiece.x + x)) + (currentPiece.y + y)]
                @var gridSquareRefresh((currentPiece.x + x), (currentPiece.y + y))
            @else
                @if pieceSquareList[(8 * (currentPiece.x)) + (currentPiece.y)].colour != pieceSquareList[(8 * (currentPiece.x + x)) + currentPiece.y + y].colour
                    @var pieceSquareList[(8 * (currentPiece.x + x)) + (currentPiece.y + y)].highlighted = true
                    @var highlightedPieces[highlightedPieces.length()] = pieceSquareList[(8 * (currentPiece.x + x)) + (currentPiece.y + y)]
                @fi
            @fi
        @fi
    @done
@done