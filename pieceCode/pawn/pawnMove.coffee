@using zomChess

@define Int xMove
@define Int yMove

# Pawn move calculations
@if currentPiece.colour == true
    @var yMove = currentPiece.y + 1
@else
    @var yMove = currentPiece.y - 1
@fi

@if (8 * (currentPiece.x + 1)) + (yMove) <= 64
    @if pieceSquareList[(8 * (currentPiece.x + 1)) + (yMove)].occupied == true && pieceSquareList[(8 * (currentPiece.x)) + (currentPiece.y)].colour != pieceSquareList[(8 * (currentPiece.x + 1)) + (yMove)].colour
        @var pieceSquareList[(8 * (currentPiece.x + 1)) + (yMove)].highlighted = true
        @var highlightedPieces[highlightedPieces.length()] = pieceSquareList[(8 * (currentPiece.x + 1)) + (yMove)]
    @fi
@fi

@if (8 * (currentPiece.x - 1)) + (yMove) >= 0
    @if pieceSquareList[(8 * (currentPiece.x - 1)) + (yMove)].occupied == true && pieceSquareList[(8 * (currentPiece.x)) + (currentPiece.y)].colour != pieceSquareList[(8 * (currentPiece.x - 1)) + (yMove)].colour
        @var pieceSquareList[(8 * (currentPiece.x - 1)) + (yMove)].highlighted = true
        @var highlightedPieces[highlightedPieces.length()] = pieceSquareList[(8 * (currentPiece.x - 1)) + (yMove)]
    @fi
@fi
@if (currentPiece.y == 1 && currentPiece.colour == true) || (currentPiece.y == 6 && currentPiece.colour == false)
    @for Int i in list::range(0,2)
        @if currentPiece.colour == true
            @var yMove = currentPiece.y + 1 + i
        @else
            @var yMove = currentPiece.y - 1 - i
        @fi

        @if pieceSquareList[(8 * (currentPiece.x)) + (yMove)].occupied == false
            @var gridSquareList[(8 * (currentPiece.x)) + (yMove)].highlighted = true
            @var highlightedBlocks[highlightedBlocks.length()] = gridSquareList[(8 * (currentPiece.x)) + (yMove)]
            @var gridSquareRefresh(currentPiece.x, yMove)
        @else
            @return
        @fi
    @done
@else        
    @if currentPiece.colour == true
        @var yMove = currentPiece.y + 1
    @else
        @var yMove = currentPiece.y - 1
    @fi

    @if pieceSquareList[(8 * (currentPiece.x)) + (yMove)].occupied == false
        @var gridSquareList[(8 * (currentPiece.x)) + (yMove)].highlighted = true
        @var highlightedBlocks[highlightedBlocks.length()] = gridSquareList[(8 * (currentPiece.x)) + (yMove)]
        @var gridSquareRefresh(currentPiece.x, yMove)
    @else
        @return
    @fi
@fi