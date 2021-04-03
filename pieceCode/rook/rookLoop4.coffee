# Negative Y piece moving function
@for Int y in list::range(1, currentPiece.y + 1)
    # Loops through the chosen direction, highlighting empty squares
    @if zomChess::lineHighlighting(currentPiece.x, currentPiece.y - y, currentPiece, 1) == false
        # Returns if it reaches a piece
        @return
    @fi
@done