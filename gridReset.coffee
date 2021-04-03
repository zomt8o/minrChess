@cooldown 4
@cancel
@using zomChess

# Clears the lists
@var pieceSquareList = PieceSquare[]
@var gridSquareList = GridSquare[]
@var highlightedBlocks = GridSquare[]

# Resets current selected piece
@var selectedPiece = -1

# Sets the current turn to white
@var turn = true

# Resumes the game
@var paused = false

# Resets the check section
@var checking = false


@var whiteKingLoc = -1
@var blackKingLoc = -1


# Iterates over every position in the list
@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        # Object creation for each piece and square
        @var pieceSquareList[(8 * x) + y] = PieceSquare(BlockLocation(currentBlock.getX() + y, currentBlock.getY() + 1, currentBlock.getZ() + x, "Zero"), x, y)
        @var gridSquareList[(8 * x) + y] = GridSquare(BlockLocation(currentBlock.getX() + y, currentBlock.getY(), currentBlock.getZ() + x, "Zero"), x, y)

        # Chequered grid
        @var gridSquareRefresh(x,y)     
    @done
@done


# White pieces
@for Int i in list::range(0,8)
    @var pieceSquareList[(8 * i) + 0].piece = pieceIDs[i]
    @var pieceSquareList[(8 * i) + 0].occupied = true
    @var pieceSquareList[(8 * i) + 0].colour = true
@done

# Black pieces
@for Int i in list::range(0,8)
    @var pieceSquareList[(8 * i) + 7].piece = pieceIDs[i]
    @var pieceSquareList[(8 * i) + 7].occupied = true
    @var pieceSquareList[(8 * i) + 7].colour = false
@done

# White pawns
@for Int i in list::range(0,8)
    @var pieceSquareList[(8 * i) + 1].piece = 0
    @var pieceSquareList[(8 * i) + 1].occupied = true
    @var pieceSquareList[(8 * i) + 1].colour = true
@done

# Black pawns
@for Int i in list::range(0,8)
    @var pieceSquareList[(8 * i) + 6].piece = 0
    @var pieceSquareList[(8 * i) + 6].occupied = true
    @var pieceSquareList[(8 * i) + 6].colour = false
@done


# Places the carpet representation of each piece
@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        @var pieceRefresh(x,y)
    @done
@done