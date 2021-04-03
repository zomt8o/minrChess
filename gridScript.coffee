@cooldown 1

@using zomChess

@if gridSquareList[(8 * gridX) + gridY].highlighted == true
    @var pieceMove(selectedPiece, (8 * gridX) + gridY)

    @var pieceRefresh(gridX, gridY)
    @var pieceRefresh(pieceSquareList[selectedPiece].x, pieceSquareList[selectedPiece].y)

    @var highlightClear()

    @if pieceSquareList[(8 * gridX) + gridY].piece == 0 && ((gridY == 7 && pieceSquareList[(8 * gridX) + gridY].colour == true) || (gridY == 0 && pieceSquareList[(8 * gridX) + gridY].colour == false))
        @var paused = true
        @var pawnPromoteChat(gridX, gridY)
    @fi
    @var turnSwitch()
@fi