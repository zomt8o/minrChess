@using zomChess

@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        @var gridSquareList[(8 * x) + y].location.set(colour + "_concrete")
    @done
@done

@delay 10

@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        @var gridSquareRefresh(x,y)
    @done
@done

@delay 10

@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        @var gridSquareList[(8 * x) + y].location.set(colour + "_concrete")
    @done
@done

@delay 10

@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        @var gridSquareRefresh(x,y)
    @done
@done