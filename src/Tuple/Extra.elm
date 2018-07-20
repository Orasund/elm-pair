module Tuple.Extra exposing (apply, mapEach, swap)

{-| useful functions for tuples


## Functions

@docs apply,mapEach,swap

-}


{-| transforms a tuple into two arguments

     apply (+) (1,2) == 3

-}
apply : (a -> b -> c) -> ( a, b ) -> c
apply fun ( a, b ) =
    fun a b


{-| mapFirst and mapSecond combined

    mapEach funA funB (a,b) == (Tuple.mapFirst funA << Tuple.mapSecond funB) (a,b)

-}
mapEach : (a -> x) -> (b -> y) -> ( a, b ) -> ( x, y )
mapEach funA funB ( a, b ) =
    ( funA a, funB b )


{-| swaps the values of a tuple

    swap (a,b) == (b,a)

    swap (swap(a,b)) == (a,b)

-}
swap : ( a, b ) -> ( b, a )
swap ( a, b ) =
    ( b, a )
