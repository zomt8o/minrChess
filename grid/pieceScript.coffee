@cooldown 1
@using zomChess

# Stops further moves if the game is paused
@if paused == true
    @return
@fi

@define PieceSquare currentPiece = pieceSquareList[(8 * pieceX) + pieceY]

@if currentPiece.highlighted == true
    # Moves 
    @var pieceMove(selectedPiece, (8 * currentPiece.x) + currentPiece.y)

    @var pieceRefresh(pieceSquareList[selectedPiece].x, pieceSquareList[selectedPiece].y)
    @var pieceRefresh(currentPiece.x, currentPiece.y)

    @var highlightClear()

    # Checks if a pawn has gotten to the opposite back rank and the starts the promotion sequence
    @if pieceSquareList[(8 * pieceX) + pieceY].piece == 0 && ((pieceY == 7 && pieceSquareList[(8 * pieceX) + pieceY].colour == true) || (pieceY == 0 && pieceSquareList[(8 * pieceX) + pieceY].colour == false))
        @var paused = true
        @var pawnPromoteChat(pieceX, pieceY)
    @fi
    
    # Advances the turn
    @var turnSwitch()
@else
    @if turn != currentPiece.colour
        @return
    @fi

    @var highlightClear()

    @if currentPiece.selected == true
        @var pieceSquareList[(8 * currentPiece.x) + currentPiece.y].selected = false
        @var selectedPiece = -1
    @else
        @var pieceSquareList[(8 * pieceX) + pieceY].selected = true
        @if selectedPiece >= 0
            @var pieceSquareList[selectedPiece].selected = false
        @fi

        @var selectedPiece =  (8 * pieceX) + pieceY

        @if currentPiece.piece == 0
            @var pawnMove(currentPiece)
        @elseif currentPiece.piece == 1
            @var rookMove(currentPiece)
        @elseif currentPiece.piece == 2
            @var knightMove(currentPiece)
        @elseif currentPiece.piece == 3
            @var bishopMove(currentPiece)
        @elseif currentPiece.piece == 4
            @var rookMove(currentPiece)
            @var bishopMove(currentPiece)
        @elseif currentPiece.piece == 5
            @var kingMove(currentPiece)
        @fi
    @fi
@fi