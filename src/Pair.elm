module Pair exposing (Pair, foldl, foldr, map, map2)

{-| These functions where created for Tuples where both values have the same type, for example 2D-coordinates.


## Definition

@docs Pair


## Functions

@docs foldl, foldr, map, map2

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

    map2 (+) (1,2) (3,4) == (4,6)

-}
map2 : (a -> b -> c) -> Pair a -> Pair b -> Pair c
map2 fun ( a, b ) ( c, d ) =
    ( fun a c, fun b d )


{-| folds from the left over both values

    foldl (//) 1 (1,2) == 2

-}
foldl : (a -> b -> b) -> b -> Pair a -> b
foldl fun c ( a, b ) =
    fun b <| fun a c


{-| folds from the right over both values

    foldr (//) 1 (1,2) == 0

-}
foldr : (a -> b -> b) -> b -> Pair a -> b
foldr fun c ( a, b ) =
    fun a <| fun b c
