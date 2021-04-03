@using zomChess

@for Int x in Int[-2,2]
    @for Int y in Int[-1,1]
        @if checking == true
            @if pieceSquareList[(8 * x) + y].occupied == true && pieceSquareList[(8 * x) + y].piece == 2 && pieceSquareList[(8 * x) + y].colour == checkColour
                @if checkColour == true
                    @var whiteCheck = true
                @else
                    @var blackCheck = true
                @fi
            @fi
        @else
            @if ((8 * (currentPiece.x + x)) + (currentPiece.y + y)) < 64 && ((8 * (currentPiece.x + x)) + (currentPiece.y + y)) >= 0
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
            @if ((8 * (currentPiece.x + y)) + (currentPiece.y + x)) < 64 && ((8 * (currentPiece.x + y)) + (currentPiece.y + x)) >= 0
                @if pieceSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)].occupied == false
                    @var gridSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)].highlighted = true
                    @var highlightedBlocks[highlightedBlocks.length()] = gridSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)]
                    @var gridSquareRefresh((currentPiece.x + y), (currentPiece.y + x))
                @else
                    @if pieceSquareList[(8 * (currentPiece.x)) + (currentPiece.y)].colour != pieceSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)].colour
                        @var pieceSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)].highlighted = true
                        @var highlightedPieces[highlightedPieces.length()] = pieceSquareList[(8 * (currentPiece.x + y)) + (currentPiece.y + x)]
                    @fi
                @fi
            @fi
        @fi
    @done
@done