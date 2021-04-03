@define zomChess::GridSquare currentBlock = zomChess::gridSquareList[(8 * x) + y]

@if currentBlock.highlighted == true
    @var currentBlock.location.set("lime_concrete")
@else
    @if (x + y) % 2 == 0
        @var currentBlock.location.set("black_concrete")
    @else
        @var currentBlock.location.set("white_concrete")
    @fi
@fi