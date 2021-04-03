@cooldown 1s
@using zomChess

# Removes the initial creation script
@bypass /script remove interact {{block.getX()}} {{block.getY()}} {{block.getZ()}}

@var currentBlock = block

# Creates an empty 2d list
@for Int i in list::range(0,8)
    @for Int j in list::range(0,8)
        @var pieceSquareList[(8 * i) + j] = null
        @var gridSquareList[(8 * i) + j] = null
    @done
@done

@var gridReset(block)

# Iterates over every position in the list
@for Int x in list::range(0,8)
    @for Int y in list::range(0,8)
        # Script creation for both pieces and the grid
        @bypass /script create interact {{block.getX() + y}} {{block.getY() + 1}} {{block.getZ() + x}} @var zomChess::pieceScript({{x}}, {{y}})
        @bypass /script create interact {{block.getX() + y}} {{block.getY()}} {{block.getZ() + x}} @var zomChess::gridScript({{x}}, {{y}})
    @done
@done

@bypass /setblock {{block.getX()}} {{block.getY()}} {{block.getZ() - 1}} crimson_button[facing=north]
@bypass /script create interact {{block.getX()}} {{block.getY()}} {{block.getZ() - 1}} @var zomChess::gridReset(zomChess::currentBlock)