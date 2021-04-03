@using zomChess

@for Int i in list::range(0,highlightedBlocks.length())
    @var gridSquareList[(8 * highlightedBlocks[i].x) + highlightedBlocks[i].y].highlighted = false
    @var gridSquareRefresh(highlightedBlocks[i].x, highlightedBlocks[i].y)
@done

@for Int i in list::range(0,highlightedPieces.length())
    @var pieceSquareList[(8 * highlightedPieces[i].x) + highlightedPieces[i].y].highlighted = false
@done

@var highlightedBlocks = GridSquare[]
@var highlightedPieces = PieceSquare[]