module Pair exposing (Pair, all, any, foldl, foldr, map, map2, toList, unzip)

{-| These functions where created for Tuples where both values have the same type, for example 2D-coordinates.


## Definition

@docs Pair


## Functions

@docs foldl, foldr, map, map2, toList, unzip, all,any

-}


{-| a Pair of two values of the same type
-}
type alias Pair a =
    ( a, a )


{-| applies a function to both values

    map ((+) 2) (1,2) == (3,4)

-}
map : (a -> b) -> Pair a -> Pair b
map fun ( a, b ) =
    ( fun a, fun b )


{-| applies a function for two pairs

    map2 (-) (1,2) (3,4) == (-2,-2)

-}
map2 : (a -> b -> c) -> Pair a -> Pair b -> Pair c
map2 fun ( a, b ) ( c, d ) =
    ( fun a c, fun b d )


{-| folds from the left over both values

    foldl (//) 1 (1,2) == 2

    foldl (::) [] (1,2) == [2,1]

-}
foldl : (a -> b -> b) -> b -> Pair a -> b
foldl fun c ( a, b ) =
    fun b <| fun a c


{-| folds from the right over both values

    foldr (//) 1 (1,2) == 0

    foldr (::) [] (1,2) == [1,2]

-}
foldr : (a -> b -> b) -> b -> Pair a -> b
foldr fun c ( a, b ) =
    fun a <| fun b c


{-| returns a list with both elements

    toList(1,2) == foldr (::) [] (1,2)

-}
toList : Pair a -> List a
toList ( a, b ) =
    [ a, b ]


{-| unzips a pair. Useless until you need it ;)

    unzip ((1,Nothing),(2,Just 1)) == ((1,2),(Nothing,Just 1))

-}
unzip : Pair ( a, b ) -> ( Pair a, Pair b )
unzip ( ( a1, b1 ), ( a2, b2 ) ) =
    ( ( a1, a2 ), ( b1, b2 ) )


{-| true if the function is true for both arguments

    all ((==) 0) (0,0) == True

    all ((==) 0) (1,0) == False

-}
all : (a -> Bool) -> Pair a -> Bool
all fun ( a, b ) =
    fun a && fun b


{-| true if the function is true for both arguments

    any ((==) 0) (1,2) == False

    any ((==) 0) (1,0) == True

-}
any : (a -> Bool) -> Pair a -> Bool
any fun ( a, b ) =
    fun a || fun b
