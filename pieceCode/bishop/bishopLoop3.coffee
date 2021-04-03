# Positive X, negative Y piece moving function
@define Int loopVar

# Chooses the shortest distance to stay within the grid
@if currentPiece.x >= currentPiece.y
    @var loopVar = currentPiece.x
@else
    @var loopVar = currentPiece.y
@fi

@for Int x in list::range(1, currentPiece.x + 1)
    # Loops through the chosen direction, highlighting empty squares
    @if zomChess::lineHighlighting(currentPiece.x - x, currentPiece.y + x, currentPiece, 3) == false
        # Returns if it reaches a piece
        @return
    @fi
@done