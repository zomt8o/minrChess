# Negative X piece moving function
@for Int x in list::range(1, currentPiece.x + 1)
    # Loops through the chosen direction, highlighting empty squares
    @if zomChess::lineHighlighting(currentPiece.x - x, currentPiece.y, currentPiece, 1) == false
        # Returns if it reaches a piece
        @return
    @fi
@done